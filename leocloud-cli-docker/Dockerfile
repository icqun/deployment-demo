FROM archlinux:latest

RUN pacman -Syu --noconfirm kubectl curl firefox

ARG user=dokka
ARG group=dokka
ARG uid=1010
ARG gid=1010
RUN groupadd -g ${gid} ${group}
RUN useradd -u ${uid} -g ${group} -s /bin/bash -m ${user}

USER ${uid}:${gid}

WORKDIR /work

COPY --chmod=777 <<-"EOF" /entrypoint.sh
#!/usr/bin/env bash

curl -fsSLO https://admission.cloud.htl-leonding.ac.at/html/leocloud-cli.tgz
tar -xzf leocloud-cli.tgz
export DISPLAY=":0"
export BROWSER=firefox
chmod +x ./leocloud/linux/leocloud
./leocloud/linux/leocloud auth login
echo "Generated Kubeconfig:"
cat ~/.kube/config
EOF

ENTRYPOINT [ "/entrypoint.sh" ]