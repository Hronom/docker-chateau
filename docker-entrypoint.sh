#!/bin/bash

envsubst '$RETHINKDB_HOST $RETHINKDB_PORT $RETHINKDB_AUTH_KEY' < /root/chateau/config.js > /root/chateau/config.js2
mv /root/chateau/config.js2 /root/chateau/config.js

chateau -f config.js -p 3000
