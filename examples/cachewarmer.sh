#!/bin/bash

PATH="/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin";
cd /home/experius/seosnap;

# Desktop cachewarm - website id = 2
echo "Desktop cachewarm"
make warm A='cache --recache=1 2' &&
         curl -fsS -m 10 --retry 5 -o /dev/null https://hc-ping.com/xxxxxxxxx

docker restart snapstack_rendertron
sleep 60

# Mobile cachewarm - website id = 2
echo "Mobile cachewarm"
make warm A='cache --recache=1 --mobile=True 2' &&
         curl -fsS -m 10 --retry 5 -o /dev/null https://hc-ping.com/xxxxxxxxx

docker restart snapstack_rendertron
sleep 60
