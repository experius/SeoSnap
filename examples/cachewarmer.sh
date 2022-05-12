#!/bin/bash

PATH="/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin";
cd /home/experius/seosnap;

echo "Cachewarm Start"

docker restart snapstack_rendertron
sleep 60

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


# New queue method Cron(s)
## Desktop cachewarm - website id = 2
make thread A='cache 2 --use_queue=1 --recache=1 --follow_next=1' && curl -fsS -m 10 --retry 5 -o /dev/null https://hc-ping.com/xxxxxxxxx
