#!/bin/bash

echo " ============================== PULLING DOCKER IMAGE ============================== "
docker pull tommylau/ocserv
echo " ============================== TRYING TO RUN DOCEKR ============================== "
read -p "Please enter your expose port:" port
docker run --name ocserv --privileged -p $port:443 -p $port:443/udp -d tommylau/ocserv
echo " ============================= SET USER AND PASSWORD ============================== "
read -p "Please enter username:" user
docker exec -ti ocserv ocpasswd -c /etc/ocserv/ocpasswd -g "Route,All" $user
