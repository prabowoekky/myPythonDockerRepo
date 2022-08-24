#!/bin/bash
kubectl config use-context azure-aksDRC
export service-drc=$(kubectl get svc python-app-svc-drc -ojsonpath='{.spec.clusterIP}')
echo $service-drc
sed -i 's/service-drc/$service-drc/g' balancing-service.yaml
kubectl config use-context eq-aksDC
export service-dc=$(kubectl get svc python-app-svc-dc -ojsonpath='{.spec.clusterIP}')
echo $service-dc
sed -i 's/service-dc/$service-dc/g' balancing-service.yaml
kubectl apply -f balancing-service.yaml
