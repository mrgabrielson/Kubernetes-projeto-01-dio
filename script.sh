#!/bin/bash

echo "Criando Imagens"

docker build -t mrgabrielson/projeto-backend-dio:1.0 backend/.
docker build -t mrgabrielson/projeto-database-dio:1.0 database/.

echo "Subindo Imagens"

docker push mrgabrielson/projeto-backend-dio:1.0
docker push mrgabrielson/projeto-database-dio:1.0

echo "Cruando Cluster"

kubectl apply -f ./services.yml

echo "Criando Deployments"

kubectl apply -f ./deployment.yml
