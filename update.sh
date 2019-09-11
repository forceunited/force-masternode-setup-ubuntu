#!/bin/bash
# This script will install all required stuff to run a Force (FOR) Masternode.
# Force Repo : https://github.com/forceunited/force
# !! THIS SCRIPT NEED TO RUN AS ROOT !!
######################################################################

clear
echo "*********** Welcome to the Force (FOR) Masternode Setup Script ***********"
echo 'This script will update your Force wallet'
echo '****************************************************************************'
sleep 3
echo '*** Step 1/3 ***'
echo '*** Remove previous Force wallet ***'
sleep 2
cd force
./Forced stop
rm -rf Forced
sleep 1
echo '*** Done 1/3 ***'
sleep 1
echo '*** Step 2/3 ***'
echo '*** Installing the latest wallet ***'
sleep 2
wget https://github.com/forceunited/force/releases/download/3.7.1.0/force-3.7.1.0-ubuntu-16.04-d.tar.gz
tar xvzf force-3.7.1.0-ubuntu-16.04-d.tar.gz
rm force-3.7.1.0-ubuntu-16.04-d.tar.gz
chmod 755 forced
mv forced /usr/local/bin
sleep 1
echo '*** Done 2/3 ***'
sleep 2
echo '*** Step 3/3 ***'
echo '*** Last Server Start also Wallet Sync ***'
echo 'After 1 minute you will see the 'getinfo' output from the RPC Server...'
forced -daemon
sleep 60
forced getinfo
sleep 2
echo 'Have fun with your Force Masternode!'
sleep 2
echo '*** Done 3/3 ***'
