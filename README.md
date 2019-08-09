# Semantix DevOps

## Provisionando o ambiente de desenvolvimento utilizando o Docker Compose e Minikube

Objetivo: Auxiliar o desenvolvedor na configuração do ambiente de desenvolvimento da aplicação SEmantix de forma rápida e com todas as vantagens promovidas pelo uso de containers.

## Requisitos

Instale os componentes abaixo:

- [Git](https://git-scm.com/downloads)
- [Docker CE](https://docs.docker.com/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)
- [Helm](https://helm.sh/docs/using_helm/)

## Docker Compose


### Configuração do ambiente

* Clone este repositório em seu ambiente de desenvolvimento:

```shell
git clone -b master https://bitbucket.org/bexstech/bexs-devops-exam.git bexs-dev
cd bexs-dev/docker-compose
```

* Construa as imagens do Docker dos microserviços representados por seus Dockerfiles:

```shell
docker-compose build
```

* Crie a network para a comunicação entre os microserviços:

```shell
docker network create --driver=bridge bexsnet
```

* E agora, inicialize os microserviços:

```shell
docker-compose up
```

* Et voilà, acesse a aplicação [clicando aqui](http://localhost:8000)!

### Observações

Por padrão, a inicialização dos microserviços com o comando ```docker-compose up``` exibirá no terminal o nome e o log das aplicações inicializadas, caso a sessão do terminal aberta para a execução do comando seja finalizada, os microserviços serão encerrados. Para mantê-los inicializados no Docker, utilize ```docker-compose up --detach``` e para realizar o debug (verificação de logs) com está condição, execute o comando ```docker attach <NOME_DO_MICROSERVIÇO>```, como por exemplo: ```docker attach backend```.

### Dicas

Você poderá verificar os containers em execução com o comando ```docker ps``` e as imagens do Docker que foram contruídas com ```docker images```.

## Minikube

### Arquitetura:

![Arquitetura](minikube.png)

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
cd bexs-dev/docker-compose
docker-compose build
```

* Instale a Chart da aplicação Bexs seguindo os passsos abaixo:

```shell
cd ../charts/bexs
helm install . --name bexs --namespace bexs
```

* Acompanhe/valide a inicialização das pods, deverão possuir o "STATUS" como "Running":

```shell
watch -n0 kubectl get pods --namespace bexs
```

* Abra uma conexão partindo do localhost na porta 8001 para o service do Frontend dentro do "cluster" do Minikube na porta 8000:

```shell
kubectl port-forward svc/bexs-frontend-service 8001:8000 --namespace bexs
```

* E novamente, et voilà. Acesse a aplicação [clicando aqui](http://localhost:8001)!
