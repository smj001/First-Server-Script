#!/bin/bash
read -p "Local Public IP:" ip
read -p "Username:" user
# echo "Script input structure: [sudo ./docker-ovpn.sh HOSTURL CLIENT_USER_NAME]"
docker volume create --name smj-service
docker run -v smj-service:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_genconfig -u tcp://$ip
docker run -v smj-service:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn ovpn_initpki
docker run -v smj-service:/etc/openvpn -d -p 6969:1194 --cap-add=NET_ADMIN kylemanna/openvpn
docker run -v smj-service:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn easyrsa build-client-full $user nopass
docker run -v smj-service:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_getclient $user > $user.ovpn
echo " ======================= openvpn deployed successfully ======================= "
echo " "
echo " ===== you can use this product with [ $user.ovpn ] file in this directory  ===== "
echo " "
echo " ==================== just input to application and enjoy ==================== "
