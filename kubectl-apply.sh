#!/usr/bin/env bash

kubectl apply -f k8s/appsrv.yaml
kubectl apply -f k8s/postgres.yaml
kubectl rollout restart deployment appsrv

while : ; do
  containers=$(kubectl get pods --sort-by=.status.startTime | grep appsrv | cut -d' ' -f1 | tac)
  c=$(echo $containers| cut --delimiter " " --fields 1)
  echo "Waiting for $c to come online"
  kubectl get pod $c | grep Running >/dev/null
  res=$?

  [[ $res != 0 ]] || break
done

echo "forwarding $c"
kubectl port-forward $c 8080:8080
