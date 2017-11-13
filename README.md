# force-masternode-setup-ubuntu-14.04
This script will help you to setup a remote Force Masternode on ubuntu 14.04 and needs your masternode genkey output from your local wallet. 

*On your local computer:*

Help > Debug Console > type ``masternode genkey``

*On the VPS:*

``wget https://raw.githubusercontent.com/forceunited/force-masternode-setup-ubuntu-14.04/master/forcesetup.sh``

``chmod +x forcesetup.sh``

``./forcesetup.sh``
