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
cd ./init/default
# or
cd ./init/covid

# pattern
mongorestore --host="{HOSTNAME}:27017" --username="{USERNAME}" --password="{PASSWORD}" --authenticationDatabase="{ROLE}"

mongorestore --host="localhost:27017" --username root --password kmuttC@Rs2020 --authenticationDatabase admin
```

##### Schema

#### areas

all reservation area will use this schema

| key                | value                                      | description                                         |
| ------------------ | :----------------------------------------- | --------------------------------------------------- |
| requires.requestor | Number (1)                                 | number of requestor required                        |
| reserve.interval   | Number (60)                                | time split for reserving                            |
| reserve.allDay     | Boolean (false)                            | this area can reseve for all day ?                  |
| reserve.start      | Date (ISODate("1999-01-01T01:00:00.000Z")) | start time                                          |
| reserve.stop       | Date (ISODate("1999-01-01T01:00:00.000Z")) | stop time                                           |
| reserve.week       | String (1-7 or 1,4,7)                      | Monday = 1, Sunday = 7                              |
| forward            | Number (3)                                 | Can reserve in advance for ... day                  |
| name               | String (football1)                         | unique name for area reference (effect to frontend) |

```JS
{
    "_id" : ObjectId("5e282abe9854030029ae0f5f"),
    "required" : {
        "requestor" : 5
    },
    "name" : "football1",
    "label" : "สนามฟุตซอล 1 (ด้านสวนธนบุรีรมย์)",
    "building" : ObjectId("5e27d4e610296a0176a3ebf9"),
    "reserve" : [
        {
            "interval" : 60,
            "max" : 0,
            "allDay" : false,
            "start" : ISODate("1999-01-01T01:00:00.000Z"),
            "stop" : ISODate("1999-01-01T13:00:00.000Z"),
            "week" : "1-5"
        }
    ],
    "forward" : 3,
    "createAt" : ISODate("2020-01-22T10:58:06.838Z"),
    "updateAt" : ISODate("2020-01-22T10:58:06.838Z"),
    "__v" : 0
}
```

##### Issues

when db not start cause have no permission to create dir e.g.

`mkdir: cannot create directory`

fix by this command

```sh
sudo chown -R 1001 ./db
```
