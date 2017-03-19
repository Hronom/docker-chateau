docker-chateau

### Build
```
docker build -t hronom/docker-chateau:0.3.16 -t hronom/docker-chateau:latest .
```

### Push
```
docker push hronom/docker-chateau
```

### Run
To run `hronom/docker-chateau` you need to set environment variables: `RETHINKDB_HOST`, `RETHINKDB_PORT` and `RETHINKDB_AUTH_KEY`.
Example docker-compose file:
```
version: '2'
services:
  hrono-rethinkdb-node-master:
    image: rethinkdb:2.3.5
    command: "rethinkdb --bind all"

  hrono-rethinkdb-node-slave:
    image: rethinkdb:2.3.5
    command: "rethinkdb --join hrono-rethinkdb-node-master --bind all"
    links:
      - hrono-rethinkdb-node-master

  hrono-rethinkdb-node-proxy:
    image: rethinkdb:2.3.5
    command: "rethinkdb proxy --join hrono-rethinkdb-node-master --bind all"
    ports:
      - "8080:8080"
      - "28015:28015"
    links:
      - hrono-rethinkdb-node-master

  hrono-rethinkdb-chateau:
      image: hronom/docker-chateau
      environment:
        - RETHINKDB_HOST=hrono-rethinkdb-node-master
        - RETHINKDB_PORT=28015
        - RETHINKDB_AUTH_KEY=
      ports:
        - "3000:3000"
```
