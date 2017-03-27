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

./buildwebapp.sh . testwebapp2 "/c/pg/java/jdk1.7.0_80"

docker-compose up -d
