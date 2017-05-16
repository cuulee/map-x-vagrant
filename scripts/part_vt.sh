#!/bin/bash

# change node version
n 6.10.0


# stop app
su - node -c "pm2 delete -s mx-vt || :"

# Clone or pull
if [[ ! -e $dirVt ]]
then
  # Install vt
  git clone --depth 1 https://github.com/fxi/map-x-vt.git $dirVt
else
  rm -rf $dirVt/node_modules
  cd $dirVt && git pull && cd -
fi

# install modules
cd $dirVt && npm install && cd -

# copy and rename settings file 
echo "var s = require('./settings-global.js');
s.pg.con = {
user : 'mapxr',
database : 'mapx',
password : '$pwdmapxr',
port : 5432,
host : 'localhost',
key : '$pwdmapxcrypto'};
s.cache = {
ttl : 1000 * 60 * 60 * 24 * 30 // time to live in ms
};
module.exports = s ;"  > $dirVt/settings/settings-local.js

chown -R node:node /home/node

su - node -c "pm2 start $dirVt/index.js --name=mx-vt"
