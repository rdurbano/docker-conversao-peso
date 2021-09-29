cd C:\Users\MVI_R\Source\Repos\docker-conversao-peso


docker image build --no-cache -t rdurbano/conversao-peso:v1 .
docker image ls
docker container run --name container_conversao_peso -d -p 5000:80 rdurbano/conversao-peso:v1
docker container ls
docker image prune