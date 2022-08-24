kubectl config use-context azure-aksDRC
service-drc=$(kubectl get svc | grep python | awk '{print $3}')
echo $service-drc
sed -i 's/service-drc/$service-drc/g' balancing-service.yaml
kubectl config use-context eq-aksDC
service-dc=$(kubectl get svc | grep python | awk '{print $3}')
echo $service-dc
sed -i 's/service-dc/$service-dc/g' balancing-service.yaml
kubectl apply -f balancing-service.yaml
