#!/bin/bash

.
if [ ! -d "./mysql/db" ]; then
   mkdir -p ./mysql/db
fi


if [ ! -d "./tomcat/logs" ]; then
   mkdir -p ./tomcat/logs
fi


if [ ! -d "./tomcat/webapps" ]; then
   mkdir -p ./tomcat/webapps
fi

./buildwebapp.sh . testwebapp2 "/usr/lib/jvm/default-java"

docker-compose up -d db
sleep 30
docker-compose up -d web
sleep 60

curl -u tomcat:password http://localhost:8080/manager/text/start?path=/testwebapp
