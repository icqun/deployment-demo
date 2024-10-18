#FROM maven:3.9.9-eclipse-temurin-21 as build

#WORKDIR /build
#COPY . /build
#RUN mvn -B clean package

FROM eclipse-temurin:21-jre

RUN mkdir -p /opt/application
COPY *-runner.jar /opt/application/backend.jar
WORKDIR /opt/application

CMD [ "java", "-jar", "backend.jar" ]

