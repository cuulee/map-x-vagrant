#!/bin/bash

# set n as node 6.10.0
n 6.10.0

# create node user if not exist
id -u node || sudo useradd -m -p $pwdnode -s /bin/bash node 

# install pm2
npm install pm2 -g

# set pm2 to start at startup
env PATH=$PATH:/usr/local/bin /usr/local/lib/node_modules/pm2/bin/pm2 startup upstart -u node --hp /home/node


