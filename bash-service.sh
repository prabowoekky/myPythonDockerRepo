#!/bin/bash
kubectl config use-context azure-aksDRC
service-drc=$(kubectl get svc | grep python | awk '{print $3}')
sed -i 's/service-drc/$service-drc/g' balancing-service.yaml
kubectl config use-context eq-aksDC
service-dc=$(kubectl get svc | grep python | awk '{print $3}')
sed -i 's/service-dc/$service-dc/g' balancing-service.yaml
kubectl apply -f balancing-service.yaml
