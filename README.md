# conversao-peso

![image](https://user-images.githubusercontent.com/12244452/135704752-be442db7-1a68-419b-92c5-c29f1b436630.png)

O container tem  a vantagem de você executar de forma isolada as imagens necessárias para executar uma aplicação / processo. Não necessitando de um SO , como uma VM, consequentemente evitando um gasto com infraestrutura. 
A arquitetura em formato de pilha para criação das imagens favorece também a economia de recursos. Favorece também a padronização e automação do ambiente, pois todas as definições para montagem da imagem estão declaradas em um arquivo docker, podendo facilmente serem replicadas.
Um outro ponto que acredito ser relevante é a questão de poder subir um ambiente de forma rápida e segura, utilizando imagens oficiais através do dockerhub.
Para o cenário de DevOps onde há necessidade de compilar códigos , container é uma ótima opção, podendo subir um container para realização do build e geração do artefato no qual será implantado no ambiente, após a operação removê-lo, fazendo isso de forma rápida. 
As principais vantagens são a velocidade na implantação de uma nova imagem , para atender uma aplicação nova por exemplo. Economia de recursos computacionais e facilidade na automação.


# Docker Geral

<b>Container </b>

<b>Imagem  </b>
template para se criar um container, toda imagem é criada em camadas, 

<b>Docker Commit   </b>
Cria a imagem baseada no container, não é possível versionar, não é possível criar automação.

<b>Dockerfile   </b>
Imagem baseada em uma receita, forma recomendada. Utiliza o conceito de camadas para construção da imagem, após a execução é mantido em cache, qualquer alteração no arquivo docker , ocorre a execução novamente.

<b> Comando no dockerfile   </b>

![image](https://user-images.githubusercontent.com/12244452/135704790-b81d3a7f-b453-4546-96da-b67a8ab2d2ac.png)


# Boas práticas

<b> Nomeando sua imagem docker </b> 

namesparce/repositorio:tag
Exemplo: fabricioveronez/api-conversao:v1
Exemplo: ubuntu:20.10 (sem namespace pois docker é proprietário)

<b> Preferência a imagens oficiais </b> 
Não utilizar imagens desconhecidas , pois podem conter conteúdo malicioso.

<b> Sempre especifique a tag nas imagens </b> 
Sem a tag será utilizada sempre a latest, isso torna seu código idempotente, ou seja não conseguiria reproduzir a mesma coisa, pois pode ocorrer alguma atualização que não esteja de acordo com a sua aplicação.

<b> Um processo por container </b> 
Colocar no container apenas um processo (se possível), distribuindo os processos por container.

<b>  Aproveitamento das camadas </b> 

<b> use o .dockerignore </b> 


# Entendimentos

<b> COPY vs ADD </b>
Utilize sempre o copy se não for usar o processo de descompactar ou pegar em uma URL

<b> ENTRYPOINT vs CMD </b> 
Entrypoint é imutável , já o CMD é possível sobrescrever na execução do container.
Os dois são comandos executados na inicialização do container.

<b> ARG </b> 
Passagem de parâmetros para utilização na criação do container.

<b> MultiStage Build  </b> 
Imagens que possuem um SDK tendem a ser pesadas mas o GO é compilado e existem imagens pequenas, é da forma acima que é feito , utilizando o MultiStage Build , que são imagens intermediárias.

![image](https://user-images.githubusercontent.com/12244452/135704844-7510d2b6-5a5e-45df-a282-bb569bab3058.png)

# Docker Registry
Repositório de imagens que eu consigo enviar minhas imagens criadas e executar onde eu quiser. O mais utilizado no mercado é o Docker Hub.
Comando para acessar o docerhub via cmd docker login ou docker push IMAGEM_NOME

Existem outros que são:
- Elastic Container Registry
- Azure Container Registry
- Google Container Registry
- Harbor




# DOCKER Não Faz

Distribuição de carga através dos container


# Lista de Comandos

Sobre   | Comando
--------- | ------
Criar um container|docker container run imagem_base
Criar um container nomeado|docker container run --name meucontainer imagem_base
Criar um container nomeado com auto remove após execução|docker container run --name meucontainer --rm imagem_base
Criar um container em modo interativo usando o bash|docker container run -it ubuntu /bin/bash
Criar um container em modo daemon liberando o terminal|docker container run -d nginx
Criar um container em modo daemon com port bind|docker container run -d -p 8080:80 nginx  (porta_local: porta_do_container)
Criar um container em modo daemon com port bind+varenv mongodb|docker container run -d -p 27017:27017 mongodb -e MONGO_INITDB_ROOT_USERNAME=mongouser -e MONGO_INITDB_ROOT_PASSWORD=mongopwd mongo
Criar um container e executar um comando |docker container run -it CONTAINER_ID comando_a_executar
Listar container ativos|docker container ls
Listar todos os containers|docker container ls -a
Remover container por CONTAINER_ID|docker container rm CONTAINER_ID
Remover container por CONTAINER_ID que esteja em execução|docker container rm -f CONTAINER_ID
Remover container por nome|docker container rm CONTAINER_NAME
Remover container por nome que esteja em execução|docker container rm -f CONTAINER_NAME
Inspecionar um container (por nome ou CONTAINER_ID) |docker container inspect mongo
Executar um comando em um container em modo interativo|docker container exec -it CONTAINER_ID /bin/bash
Parar a execução de um container|docker container stop CONTAINER_ID
Iniciar a execução de um container|docker container start CONTAINER_ID
Ver os logs de um container |docker container logs CONTAINER_ID
Ver os logs de um container (últimas 5 linhas)|docker container logs -n 5 CONTAINER_ID
Ver os logs de um container (em tempo real - follow)|docker container logs -f CONTAINER_ID
Ver os logs de um container (com data e hora)|docker container logs -t CONTAINER_ID
Listar imagens|docker image ls
Construir Imagens|docker image build --no-cache -t rdurbano/conversao-peso:v1 .
Eliminar imagens não vinculadas a repositórios|docker image prune
Eliminar uma imagem|docker image rm IMAGE_ID
Ver os dados de uma imagem|docker image inspect IMAGE_ID
Ver o histórico de comandos executados na imagem |docker image history IMAGE_ID



