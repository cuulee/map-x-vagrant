#!/bin/bash

#
# set variables
#
#fileDump="map-x-backup-"$(date +'%H')".sql"
fileDump="mapx.sql"
pathDump="/vagrant/data/postgres"

#
# dump db
#
(
vagrant ssh -c "sudo su - postgres -c 'pg_dump -U postgres -d mapx > /tmp/$fileDump' && sudo mv /tmp/$fileDump $pathDump/ "
)
