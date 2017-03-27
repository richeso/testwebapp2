#!/bin/bash

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/opt/bin:/opt/bin

cd /volumes/projects/testwebapp2

docker stop mytomcat
docker stop mysqldb
docker rm mytomcat
docker rm mysqldb
docker rmi testwebapp2_db
docker-compose up -d

sleep 5
## Start testwebapp
curl -u tomcat:password http://mycoreos1:8080/manager/text/start?path=/testwebapp 