# Semantix DevOps

## Teste semantix. Provisionando um ambiente utilizando o Docker Compose, Minikube, Docker, Github e outras paradas. 


Objetivo: Auxiliar o desenvolvedor na configuração do ambiente de desenvolvimento da aplicação Semantix com uso de containers.

## Requisitos

Instale os componentes abaixo:

- [Git/Runner] (https://git-scm.com/downloads)
- [Docker CE](https://docs.docker.com/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)
- [Helm](https://helm.sh/docs/using_helm/)


============================
### Configuração do ambiente

* Clone este repositório em seu ambiente de desenvolvimento:

```shell
git clone -b master https://github.com/cauemaciel/semantix_app.git semantix
```

* Construa as imagens do Docker dos microserviços representados por seus Dockerfiles:

```shell
docker-compose build
Para teste rapido do Dockerfile use: "docker build -t semantix ."
```

* Crie a network para a comunicação entre os microserviços:

```shell
docker network create --driver=bridge semantix
```

* E agora, inicialize os microserviços:

```shell
docker-compose up
```

* Acesse a aplicação (http://localhost:4000)!

### Observações

Por padrão, a inicialização dos microserviços com o comando ```docker-compose up``` exibirá no terminal o nome e o log das aplicações inicializadas, caso a sessão do terminal aberta para a execução do comando seja finalizada, os microserviços serão encerrados. Para mantê-los inicializados no Docker, utilize ```docker-compose up --detach``` e para realizar o debug (verificação de logs) com está condição, execute o comando ```docker attach <NOME_DO_MICROSERVIÇO>```, como por exemplo: ```docker attach backend```.

### Dicas

Você poderá verificar os containers em execução com o comando ```docker ps``` e as imagens do Docker que foram contruídas com ```docker images```.

### Configuração do ambiente

* Instale o Kubectl (binário de comandos do Kubernetes), conforme o link descrito nos "Requisitos";

* Instale o Minikube, seguindo os passos no link na sessão de "Requisitos";

* Provisione o "cluster" do Minikube com o comando abaixo:

```shell
minikube start --vm-driver <DRIVER_INSTALADO_POSTERIORMENTE>
```

* Instale o Helm, conforme o link descrito nos "Requisitos";

* Abra uma nova sessão no terminal, execute o comando abaixo para criar um link entre o repositório de imagens do Docker local e o "cluster" do Minikube, para podermos utilizar as imagens dos microserviços:

```shell
eval $(minikube docker-env)
```

* Permanecendo na mesma sessão que foi criada, realize a contrução das imagens novamente seguindo os passos abaixo:

```shell
cd semantix-dev/docker-compose
docker-compose build
```

* Instale a Chart da aplicação Semantix seguindo os passsos abaixo:

```shell
cd ../charts/semantix
helm install . --name semantix --namespace semantix
```

* Acompanhe/valide a inicialização das pods, deverão possuir o "STATUS" como "Running":

```shell
watch -n0 kubectl get pods --namespace semantix
```

* Abra uma conexão partindo do localhost na porta 8001 para o service do Frontend dentro do "cluster" do Minikube na porta 8000:

```shell
kubectl port-forward svc/semantix-frontend-service 4001:4000 --namespace semantix
```

* Acesse a aplicação (http://localhost:4000)!
