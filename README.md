# KMUTT-CARS
## Getting Started
Preparing the server environment

### Server Setup
Install Docker and Docker-compose follow this link 
- [Docker Setup](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04)
- [Docker-Compose Setup](https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-18-04)

### Prerequisites
- MongoDB cli 4.x
- Mongo Restore (For Remote/Server)
- Ubuntu 18 (For server)
- mongo-tools

### Project Setup

##### Server Setup
clone project

```sh
git clone https://github.com/yee2542/CARS-KMUTT
cd ./CARS-KMUTT
```

initialize submodule
```sh
git submodule update --init --recursive
```

then use docker-compose to run a project in production environment use **docker-compose.uat.yml** by passing via -f args and -d for running in backgroud

```sh
docker-compose -f docker-compose.uat.yml up -d
```

for fresh build or any resolve soft-cache problem try add --build to run it

```sh
docker-compose -f docker-compose.uat.yml up -d --build
```

##### Server/Remote Setup

install mongorestore tools

```
apt install mongo-tools
```

then dump a area, staff data to database via mongorestore

if you're restoring from remote check a connectivity of server that allow **ports:27017** and change the **HOSTNAME** to the server ip

point 


```sh
cd ./init

mongorestore --host="{HOSTNAME}:27017" --username root --password kmuttC@Rs2020 --authenticationDatabase admin
```





