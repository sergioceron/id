# DIGITAL IDENTITY
Manual de instalación de la plataforma de identidad digital desarrollada por
Everis. 

## Arquitectura de la Plataforma

1. **Red Ethereum**  Blockchain de nodos de Parity
2. **Blockchain Backend**  Smart contracts
3. **Data Access Service - DAS** Servicio de perfiles de usuario
4. **App Móvil**

End-of-life:
5. **Mobile Backend**  Aplicación Web Node para la App mobile
6. **Microservicios backend** de comunicación con Parity (en repositorio blockchain-backend)
    - Microservicio Nodeapi
    - Microservicio Attester
    - Microservicio Registro
    - Microservicio GraphQL
    - Microservicio IPFS

## Requerimiento

- System: Linux Ubuntu 16.04
- Docker: 17.09 CE

## Repositorios

1. **Red Ethereum** 
```
    git clone -b alastria https://gitlab.com/everis-blockchain/id/ethereum-node.git
```
2. **Blockchain Backend**  
```
    git clone -b alastria https://gitlab.com/everis-blockchain/id/blockchain-backend.git
```

Ruta de contratos
```
cd blockchain-backend/ethereum/contracts
````

3. **Data Access Service - DAS** Administración de datos de usuario
```
    git clone -b alastria https://gitlab.com/everis-blockchain/id/das.git
```
4. **App Móvil**
```
    git clone -b alastria https://gitlab.com/everis-blockchain/id/idapp.git
```
5. **Mobile Backend** (End-of-life) Aplicación Web Node para la App mobile
```
    git clone -b alastria https://gitlab.com/everis-blockchain/id/mobile-backend.git
```

## Instalacion

1. **Red Ethereum**  Blockchain de nodos de Parity
2. IPFS
    Variables:
    - export ipfs_staging=/Users/Edumar/blockchain/ID/ipfs/volume/export
    - export ipfs_data=/Users/Edumar/blockchain/ID/ipfs/volume/data


    ```
    $ cd /ms/ipfs
    $ docker build -t ipfsid:latest -f Dockerfile .
    $ docker run -d --name ipfs_host -v $ipfs_staging:/export  -v $ipfs_data:/data/ipfs  -p 4001:4001  -p 127.0.0.1:8080:8080  -p 127.0.0.1:5001:5001 ipfsid:latest
    ```
3. **Blockchain Backend**  Microservicios de comunicación con Parity

4. **Data Access Service - DAS** Administración de datos de usuario
    Compile la Aplicacion DAS
    ```
    $ cd das
    $ gradle clean build -x test
    ```
    Compile dockerfile
    
    ```
    docker build -t das:v1.0 -f Dockerfile .

    ```
    Arrancar contenedor
    
    ```
    docker run  -itd  --name das -p 5070:5070  --link ipfs_host:ipfs_host --env HOST_LOGSTASH=52.225.224.83  --env BLOCKCHAIN_URL=http://192.168.1.102:8545 --env VERIFY_HOST=192.168.1.102 --env IPFS_URL=http://ipfs_host --env BLOCKCHAIN_PASSWORD=WcjqHOdBTUYkIUVD das:v1.0
    ```
    Variables de entorno:
    - BLOCKCHAIN_URL = URL nodo ethereum
    - BLOCKCHAIN_PASSWORD = Password de cuenta para despliegue de contratos.
    - IPFS_URL = URL nodo de IPFS
    - HOST_LOGSTASH = URL microservicio de LogStash
    - VERIFY_HOST = Microservicio Nodeapi

5. **Mobile Backend**  Aplicación Web Node para la App mobile (según versión)
6. **App Mobile**



