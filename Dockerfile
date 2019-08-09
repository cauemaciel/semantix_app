  #Imagem do Docker será construída a partir de uma imagem existente, tiangolo / uwsgi-nginx-flask, que você pode encontrar no DockerHub. 
  #Essa imagem do Docker em particular é uma boa escolha em relação às outras, pois oferece suporte a uma ampla variedade de versões e imagens do SO do Python.
  FROM tiangolo/uwsgi-nginx-flask:python3.6-alpine3.7
 
  #Adiciona uma ferramenta de comando de linhas. 
  RUN apk --update add bash vim

  #Instala o processador de comandos bash e o editor de texto vim. 
  #Instala o cliente git para "pull" e "push" para serviços de hospedagem de controle de versão, como GitHub, GitLab e Bitbucket.
  ENV STATIC_URL /app
  ENV STATIC_PATH /var/www/app
  ENV FLASK_APP app.py 
 
  #Copia e executa o arquivo de requirements.txt
  COPY --from=builder /project/teste /teste
  COPY ./app.py /var/www/app.py
  RUN pip install --upgrade pip
  COPY ./requirements.txt /var/www/requirements.txt
  RUN pip install -r /var/www/requirements.txt
 
  #Expose service 4000
  EXPOSE  4000
  CMD ["python", "/root/projeto/semantix/app.py", "-p 4000"]

