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
echo '*** Step 1/3 ***'
echo '*** Installing packages & copying Force wallet ***'
sleep 2
sudo apt-get update -y
sudo apt-get dist-upgrade -y
sudo apt-get -y update && sudo apt-get -y install build-essential libssl-dev libdb++-dev libdb4.8-dev libdb4.8++-dev libboost-all-dev libcrypto++-dev libqrencode-dev libminiupnpc-dev libgmp-dev libgmp3-dev autoconf autogen automake libtool
wget https://github.com/forceunited/force/releases/download/v3.6.0.0/force-3.6.0.0-ubuntu.tar.zf
tar xvf force-3.6.0.0-ubuntu.tar.zf
rm force-3.6.0.0-ubuntu.tar.zf
chmod 755 Forced
mkdir force
mv Forced force/Forced
cd force
sleep 1
echo '*** Done 1/3 ***'
sleep 1
echo '*** Step 2/3 ***'
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

echo -e "rpcuser=forcemasternode1245523 \nrpcpassword=$usrpas \nrpcallowip=127.0.0.1 \nlisten=1 \nserver=1 \ndaemon=1 \nstaking=0 \nmasternodeaddr=$ipaddress \nmasternode=1 \nmasternodeprivkey=$mngenkey \n" > ~/.Force/Force.conf

echo '*** Done 2/3 ***'
sleep 2
echo '*** Step 3/3 ***'
echo '*** Last Server Start also Wallet Sync ***'
echo 'After 1 minute you will see the 'getinfo' output from the RPC Server...'
./Forced -daemon
sleep 60
./Forced getinfo
sleep 2
echo 'Have fun with your Masternode!'
sleep 2
echo '*** Done 3/3 ***'
