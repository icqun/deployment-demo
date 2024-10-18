#!/usr/bin/env bash

trap "minikube stop" EXIT SIGINT
minikube start
minikube addons enable metrics-server
minikube addons enable dashboard
minikube dashboard