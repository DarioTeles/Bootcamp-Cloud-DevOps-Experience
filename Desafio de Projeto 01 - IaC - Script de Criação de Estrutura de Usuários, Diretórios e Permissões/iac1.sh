#!/bin/bash

echo "Criando os diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando os grupos..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando os usuários..."

useradd carlos -c "Carlos" -s /bin/bash -m -p $(openssl passwd -6 Senha123) -G GRP_ADM
useradd maria -c "Maria" -s /bin/bash -m -p $(openssl passwd -6 Senha123) -G GRP_ADM
useradd joao_ -c "Joao" -s /bin/bash -m -p $(openssl passwd -6 Senha123) -G GRP_ADM

useradd debora -c "Debora" -s /bin/bash -m -p $(openssl passwd -6 Senha123) -G GRP_VEN
useradd sabastiana -c "Sabastiana" -s /bin/bash -m -p $(openssl passwd -6 Senha123) -G GRP_VEN
useradd roberto -c "Roberto" -s /bin/bash -m -p $(openssl passwd -6 Senha123) -G GRP_VEN

useradd josefina -c "Josefina" -s /bin/bash -m -p $(openssl passwd -6 Senha123) -G  GRP_SEC
useradd amanda -c "Amanda" -s /bin/bash -m -p $(openssl passwd -6 Senha123) -G GRP_SEC
useradd rogerio -c "Rogério" -s /bin/bash -m -p $(openssl passwd -6 Senha123) -G GRP_SEC

echo "Especificando donos e grupos dos diretórios..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

echo "Especificando níveis de permissões dos diretorios..."

chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

echo "Script executado com sucesso."