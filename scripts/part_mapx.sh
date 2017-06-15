#!/bin/bash

cd $dirShinyApp
workerPrefix="w"
workerMain="$workerPrefix""1"
#   echo "<html><head><meta http-equiv=\"refresh\" content=\"0; url=w0\"></head></html>" > /srv/shiny-server/index.html
if [[ ! -e "$workerMain" ]]
then
  git clone --depth=1 https://github.com/fxi/map-x-mgl.git "$workerMain"
  cd $workerMain
else
  cd $workerMain
  git pull
fi

#
# postgres configuration
#
echo 'config[["pg"]] = list(
host ="127.0.0.1",
dbname = "mapx",
port = "5432",
user = "mapxw",
encryptKey = "'$pwdmapxcrypto'",
password = "'$pwdmapxw'",
conPool = 5,
geomCol = "geom",
tables = list(
"users"="mx_users",
"views"="mx_views",
"sources"="mx_sources"
)
);'> settings/settings-local.R

#
# remote server configuration
#
echo 'config[["remote"]] <- list(
hostname="map-x-full",
host="127.0.0.1",
user="vagrant",
port=2222
)' >> settings/settings-local.R

if [[ ! -z $vtport ]]; then vtport=":"$vtport; fi;

echo 'config[["vt"]] <- list(
port="'$vtport'"
)' >> settings/settings-local.R

#
# Set ownership back to shiny
#
echo "Update ownership to shiny"
chown -R shiny:shiny /srv/shiny-server

#
# Use checkpoint to install or update packages 
#
echo "Run global, which will test loading mapx and update libraries if needed"
su shiny -c 'Rscript global.R'
su shiny -c 'touch restart.txt'

#
# Create workers
#
cd $dirShinyApp
if [[ $nMapxWorkers -gt 1 ]]
then
  for i in $(seq 2 $nMapxWorkers)
  do
    echo "creating worker $1"
    if [[ -e $workerPrefix$i ]]
    then
      rm -rf $workerPrefix$i
    fi
    su shiny -c "cp -r '$workerMain' '$workerPrefix$i'"
  done
fi

