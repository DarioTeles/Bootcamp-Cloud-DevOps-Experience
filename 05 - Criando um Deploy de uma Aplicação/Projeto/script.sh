#Obs1: Como estou utilizando o Minikube no qual requer o Virtual Box e não é possível utilizar o Docker ao mesmo tempo
#na mesma máquina, as etapas "Criando as imagens..." e "Realizando o push das imagens..." foram realizadas 
#numa VM Linux.

#Obs2: A etapa "Gerando a URL referente ao serviço php-service (LoadBalancer) no qual será utilizado no FrontEnd" é
#necessário devido ao Minikube.

echo "Criando as imagens..."

docker build -t darioteles/projeto-k8s-mysql backend/.
docker build -t darioteles/projeto-k8s-php database/.

echo "Realizando o push das imagens..."

docker push darioteles/projeto-k8s-mysql
docker push darioteles/projeto-k8s-php

echo "Criando serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml

echo "Gerando a URL referente ao serviço php-service (LoadBalancer) no qual será utilizado no FrontEnd"

minikube service --url php-service 

