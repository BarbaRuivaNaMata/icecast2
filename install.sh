#!/bin/bash

echo "Iniciando configuracao laboratorio"

echo "Configurando rede no docker..." 

docker network create RedeLocal

echo "Construindo a imagem icecast2"
cd icecast2
docker build -t icecast2-image .

echo "Criando conteiner icecast"
docker run -d --name icecast --network RedeLocal -p 8000:8000 icecast2-image

echo "Criando imagem nginx"
docker pull nginx

echo "Criando conteiner nginx"
cd ..
cd nginx
docker run -d --name nginx --network RedeLocal -p 80:80 -v ./nginx.conf:/etc/nginx/nginx.conf nginx


