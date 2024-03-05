app_microservices

Nebil et Katarzyna

This project consists of deploying a microservices application for vehicle tracking in the AWS cloud, leveraging technologies such as Kubernetes, Docker, Terraform, Jenkins, Prometheus, Alert Manager, horizontal scaling, readiness, Ingress, and CI/CD with Helm.



mkdir kasia
cd kasia/
git clone git@github.com:katarzyna-da-silva/app_microservices.git
docker build -t webapp:0.1 .
docker tag webapp:0.1 lnebilos/webapp:0.1
docker push lnebilos/webapp:0.1
kubectl create deployment webapp-deploy --image=lnebilos/webapp:0.1 --dry-run=client -o yaml > deployment.yaml
kubectl create configmap webapp-cm --dry-run=client -o yaml > webapp-configmap.yaml
kubectl create service clusterip webapp-clusterip --tcp=30080:80 --dry-run=client -o yaml > webapp-service.yaml
kubectl create service loadbalancer loadbalancer --tcp=80 --dry-run=client -o yaml > loadbalancer.yaml
