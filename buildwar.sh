#!/bin/bash


if [ ! -d "./mysql/db" ]; then
   mkdir -p ./mysql/db
fi


if [ ! -d "./tomcat/logs" ]; then
   mkdir -p ./tomcat/logs
fi


if [ ! -d "./tomcat/webapps" ]; then
   mkdir -p ./tomcat/webapps
fi


./buildwebapp.sh . testwebapp2 "/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.45.x86_64/"




