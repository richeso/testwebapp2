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

add-apt-repository ppa:openjdk-r/ppa
apt-get update
apt-get install openjdk-7-jdk
update-java-alternatives -s java-1.7.0-openjdk-amd64

./buildwebapp.sh . testwebapp2 "/usr/lib/jvm/default-java"

docker-compose up -d db
sleep 30
docker-compose up -d web
sleep 60

curl -u tomcat:password http://localhost:8080/manager/text/start?path=/testwebapp
