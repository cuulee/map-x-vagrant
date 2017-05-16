#!/bin/bash

sudo -u postgres psql -c "ALTER ROLE mapxw WITH PASSWORD '$pwdmapxw';"
sudo -u postgres psql -c "ALTER ROLE mapxr WITH PASSWORD '$pwdmapxr';"
sudo -u postgres psql -c "ALTER ROLE postgres WITH PASSWORD '$pwdpostgres';"
service postgresql restart 

