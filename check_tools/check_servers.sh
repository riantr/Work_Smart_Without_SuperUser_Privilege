#!/bin/bash

for i in $(seq 1 254)
do 
ping -c 2 172.16.18.$i >>pinglog
done
sed -i '/^---/d' pinglog
sed -i '/^2/d' pinglog
sed -i '/^1/d' pinglog
sed -i '/^pipe/d' pinglog
sed -i '/^rtt/d' pinglog
sed -i '/^PING/d' pinglog
sed -i '/^From/d' pinglog
sed -i 's/......................$//' pinglog
sed -i 's/64 bytes from //g' pinglog
cat pinglog | sort | uniq 
