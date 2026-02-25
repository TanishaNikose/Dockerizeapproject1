#!/bin/bash

STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)

if [ $STATUS -ne 200 ]
then
    echo "App is down! Restarting..." >> /home/ubuntu/health.log
    docker restart myapp
fi