# DIGITAL IDENTITY
Manual de instalación de la plataforma de identidad digital desarrollada por
Everis. 

## Arquitectura de la Plataforma

1. **Red Ethereum**  Blockchain de nodos de Parity
2. **Blockchain Backend**  Microservicios de comunicación con Parity
    - Microservicio Nodeapi
    - Microservicio Attester
    - Microservicio Registro
    - Microservicio GraphQL
    - Microservicio IPFS
3. **Mobile Backend**  Aplicación Web Node para la App mobile
4. **Data Access Service - DAS** Administración de datos de usuario
5. **App Mobile**

## Requerimiento

- system: Linux Ubuntu 16.04
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

ruta de contrados
```
cd /ethereum/contracts
````

3. **Mobile Backend**  Aplicación Web Node para la App mobile
```
    git clone -b alastria https://gitlab.com/everis-blockchain/id/mobile-backend.git
```
4. **Data Access Service - DAS** Administración de datos de usuario
```
    git clone -b alastria https://gitlab.com/everis-blockchain/id/das.git
```
5. **App Mobile**
```
    git clone -b alastria https://gitlab.com/everis-blockchain/id/idapp.git
```
## Instalacion

1. **Red Ethereum**  Blockchain de nodos de Parity
2. **Blockchain Backend**  Microservicios de comunicación con Parity
3. **Mobile Backend**  Aplicación Web Node para la App mobile
4. **Data Access Service - DAS** Administración de datos de usuario
5. **App Mobile**
#


