#!/bin/bash
cd /usr/local/tomcat/bin
./startup.sh
cd /usr/local/tomcat/logs
if [ ! -f catalina.out ]
then
   sleep 3s
fi
tail -f catalina.out
