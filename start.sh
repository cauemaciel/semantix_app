#!/bin/bash
app="docker.test.semantix"
docker build -t ${app} .
docker run -d -p 4000:80 \
  --name=${app} \
  -v $PWD:/app.py ${app}
