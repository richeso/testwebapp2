#!/bin/bash

get_script_dir () {
     SOURCE="${BASH_SOURCE[0]}"
     # While $SOURCE is a symlink, resolve it
     while [ -h "$SOURCE" ]; do
          DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
          SOURCE="$( readlink "$SOURCE" )"
          # If $SOURCE was a relative symlink (so no "/" as prefix, need to resolve it relative to the symlink base directory
          [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
     done
     DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
     echo "$DIR"
}


if [ "$(uname)" == "Darwin" ]; then
    echo ">>> Running Under MAC OSX : "
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo ">>> Running under Linux Platform : "
    export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/opt/bin:/opt/bin
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under 32 bits Windows NT platform
    echo ">>> Running under Windows -  MINGw32: "
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then 
    echo ">>> Running under WIndows - MINGW64: "
fi

srcscript="${BASH_SOURCE[0]}"
basedir=$(get_script_dir)
echo ">>> basedir of invocation script: $srcscript is $basedir "

##export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/opt/bin:/opt/bin
##cd /c/Users/docker/testwebapp2

cd $basedir
docker stop mytomcat
docker stop mysqldb
docker rm mytomcat
docker rm mysqldb
docker rmi testwebapp2_db
docker-compose up -d

sleep 10
## Start testwebapp
curl -u tomcat:password http://localhost:8080/manager/text/start?path=/testwebapp 