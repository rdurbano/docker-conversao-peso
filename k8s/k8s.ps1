#criar imagem docker
docker build -t rdurbano/docker_conversao_peso:v1 .
docker tag rdurbano/docker_conversao_peso:v1 rdurbano/docker_conversao_peso:latest
docker image ls
docker login
docker push rdurbano/docker_conversao_peso:v1
docker push rdurbano/docker_conversao_peso:latest


#criar o cluster
cd k8s
kind delete cluster --name kubecluster
kind create cluster --name kubecluster --config .\cluster.yaml

kind get clusters
kubectl get nodes
docker container ls
docker container inspect 359e2d64bab7


#criar o deploymet
kubectl delete service/appconverter-peso
kubectl delete deployment/appconverter-peso

kubectl apply -f deployment.yaml


kubectl get all 

