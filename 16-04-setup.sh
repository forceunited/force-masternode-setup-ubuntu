#!/bin/bash
# This script will install all required stuff to run a Force (FOR) Masternode.
# Force Repo : https://github.com/forceunited/force
# !! THIS SCRIPT NEED TO RUN AS ROOT !!
######################################################################

clear
echo "*********** Welcome to the Force (FOR) Masternode Setup Script ***********"
echo 'This script will install all required updates & package for Ubuntu 16.04 !'
echo 'Clone & Compile the FOR Wallet also help you on first setup and sync'
echo '****************************************************************************'
sleep 3
echo '*** Step 1/4 ***'
echo '*** Installing packages & copying Force wallet ***'
sleep 2
sudo apt-get update -y
sudo apt-get dist-upgrade -y
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:bitcoin/bitcoin -y
sudo apt-get -y update
sudo apt-get -y install build-essential libssl-dev libdb++-dev libboost-all-dev libcrypto++-dev libqrencode-dev libminiupnpc-dev libgmp-dev autoconf autogen automake libtool libgmp3-dev
wget https://github.com/forceunited/force/releases/download/v3.7.0.0/force-3.7.0-0-ubuntu-16.04-d.tar.gz
tar xvzf force-3.7.0-0-ubuntu-16.04-d.tar.gz
rm force-3.7.0-0-ubuntu-16.04-d.tar.gz
chmod 755 Forced
mkdir force
mv Forced force/Forced
cd force
sleep 2
echo '*** Done 1/4 ***'
sleep 2
echo '*** Step 2/4 ***'
echo '*** Starting & configuring the wallet ***'
sleep 2
./Forced -daemon
sleep 3
echo -n "Please Enter a STRONG Password or copy & paste the password generated for you above and Hit [ENTER]: "
read usrpas
echo -n "Please Enter your masternode genkey respond and Hit [ENTER]: "
read mngenkey
echo -n "Please Enter the IP address and port of your VPS (ex: xx.xx.xx.xx:37245) and Hit [ENTER]: "
read ipaddress

echo -e "rpcuser=forcemasternode1245523 \nrpcpassword=$usrpas \nrpcallowip=127.0.0.1 \nlisten=1 \nserver=1 \ndaemon=1 \nstaking=0 \nmasternodeaddr=$ipaddress \nmasternode=1 \nmasternodeprivkey=$mngenkey \naddnode=107.191.52.131:37246 \naddnode=114.24.38.222:58490 \naddnode=134.0.195.42:63823 \naddnode=140.82.58.142:37246 \naddnode=144.76.12.130:49192 \naddnode=149.28.158.81:37246 \naddnode=172.10.132.218:55247 \naddnode=173.199.70.89:37246 \naddnode=195.201.113.24:37246 \naddnode=195.201.186.130:60294 \naddnode=198.13.54.63:43090 \naddnode=206.189.218.76:37246 \naddnode=207.148.26.102:35702 \naddnode=37.120.28.224:39512 \naddnode=45.32.111.192:37246 \naddnode=45.32.212.93:47196 \naddnode=45.63.92.55:37246 \naddnode=45.76.114.66:50378 \naddnode=45.76.46.105:37246 \naddnode=45.77.185.74:36192 \naddnode=45.77.210.182:37246 \naddnode=45.77.233.110:37246 \naddnode=80.240.26.85:37246 \naddnode=81.165.249.50:51853 \naddnode=91.12.172.130:33274 \naddnode=93.35.174.83:32062" > ~/.Force/Force.conf
sleep 2
echo '*** Done 2/4 ***'
sleep 2
echo '*** Step 3/4 ***'
echo '*** Adding the swap file ***'
sleep 2
sudo fallocate -l 2G /swapfile && sudo chmod 600 /swapfile && sudo mkswap /swapfile && sudo swapon /swapfile
echo -e "/swapfile none swap sw 0 0" > /etc/fstab
sleep 2
echo '*** Done 3/4 ***'
sleep 2
echo '*** Step 4/4 ***'
echo '*** Last Server Start also Wallet Sync ***'
echo 'After 1 minute you will see the 'getinfo' output from the RPC Server...'
./Forced -daemon
sleep 60
./Forced getinfo
sleep 2
echo 'Have fun with your Force Supernode!'
sleep 2
echo '*** Done 4/4 ***'
