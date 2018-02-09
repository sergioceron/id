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
2. **Data Access Service - DAS** Administración de datos de usuario
3. **Blockchain Backend**  Microservicios de comunicación con Parity
4. **Mobile Backend**  Aplicación Web Node para la App mobile (según versión)
5. **App Mobile**
#


