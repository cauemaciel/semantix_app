# DevOps, take home test

Obrigado por considerar a posição do Engenheiro de DevOps na Semantix! Nós projetamos este teste para ter uma melhor idéia sobre sua experiência e ter uma noção de como você aborda problemas que podem aparecer em nosso dia a dia.

Você tem dois dias para concluir a tarefa e pode perguntar via email se algo não estiver claro.

* Por favor, confirme o recebimento do email.



## Código de uma API de dados

Para este exercício, assumimos um ambiente de shell bash (ou bash like), com
acesso ao Git, Python, Curl e Make.

O aplicativo (app.py) incluído neste pacote é um serviço feito em Python utilizando um framework específico em python. Rescreva o código, utilizando qualquer linguagem ou framework que prefira, de modo a que a busca em tal aplicação tenha performance melhor e de modo que seja executável dentro de um container docker. 

Para obter o conjunto de dados para trabalhar, por favor, execute este comando

    curl -w '\ n' -s "https://www.getyourguide.com/-t62214/reviews.json?&count=50&page=[0-50]&rating=0&type=&sortBy=&direction=&remove=false" >> data.json

Com o arquivo “data.json” no lugar, por favor, dê uma olhada no (README.md)
incluído no projeto que explica como executar o serviço.

### Tarefa 1 - Melhoria

A implementação melhorada deve ter essas características.

- É ao menos 2 vezes mais rápida que a atual.
- Contrua um container que inicia o serviço refatorado automaticamente expondo-o na porta 4000.
- O container deverá ser fornecido via dockerfile sendo este criado de uma imagem base que contenha somente o básico de um sistema operacional de escolha (ubuntu ou centos de preferência). 
- Forneça o repositório no github ou gitlab com instruções de uso.
- Caso tenha uma idéia melhor que aumentaria ainda mais a performance do app mas que não conseguiu implementar tendo em vista as restrições anexe sua idéia nas explicações. 


## Tarefa 2 -  Criação de Pipeline 

Forneça um container com o seu CI/CD preferido contendo um pipeline que tenha os seguintes passos: 

- Busca o repositório fornecido no item anterior.
- Cria o container via Docker build. 
- Inicia o container na porta 4000. 

Forneça o container com o seu CI/CD (tar) e instruções de implantação em um servidor linux (caso queira subir os arquivos em outro Git Repo fique a vontado)


Desejamos boa sorte. 




