#!/bin/bash

dbExists=$(su - postgres -c 'psql -lqt | cut -d \| -f1 | grep "mapx" | wc -l')
dbUsersExists=$(
if [[ $dbExists -eq 1 ]]
then
  echo $(su - postgres -c 'psql -d mapx -c "select tablename from pg_tables;" | grep "mx_users" | wc -l')
else
  echo 0
fi
)

# config postgres
echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/9.5/main/pg_hba.conf
echo "listen_addresses='*'" >> /etc/postgresql/9.5/main/postgresql.conf

# CREATE MAPX DB
if [[ $dbExists -eq 0  ]] 
then
  echo "mapx db not found. create it"
  sudo -u postgres psql -c "CREATE DATABASE  mapx ENCODING 'UTF8';"
else
  echo "mapx db already present : continue"
fi

# SET ROLES AND USERS GLOBAL ACROSS CLUSTER
sudo -u postgres psql -d mapx -c "
--
-- Postgres
--
ALTER USER postgres WITH PASSWORD '$pwdpostgres';
--
-- readonly
--
CREATE ROLE  readonly;
-- connect
GRANT CONNECT ON DATABASE mapx TO readonly;
-- usage
GRANT USAGE ON SCHEMA public to readonly;
-- privilege
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly;
-- execute
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO readonly;
--
-- mapxr 
--
CREATE ROLE mapxr WITH LOGIN ENCRYPTED PASSWORD '$pwdmapxr' IN ROLE readonly;
--
-- readwrite
--
CREATE ROLE readwrite;
-- connect
GRANT CONNECT ON DATABASE mapx TO readwrite;
-- usage
GRANT USAGE ON SCHEMA public to readwrite;
-- privileges
GRANT SELECT,INSERT,UPDATE ON ALL TABLES IN SCHEMA public TO readwrite;
-- execute
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO readwrite;
--
-- mapxw
--
CREATE ROLE mapxw WITH LOGIN ENCRYPTED PASSWORD '$pwdmapxw' IN ROLE readwrite;
-- 
-- Give select privilege to readonly for FUTURE table created by mapxw;
--
ALTER DEFAULT PRIVILEGES FOR ROLE mapxw GRANT SELECT ON TABLES TO readonly;"


# INIT EXTENSIONS
sudo -u postgres  psql -d mapx -c "
-- postgis spatial data 
CREATE EXTENSION IF NOT EXISTS postgis;
-- case insensitive type; 
CREATE EXTENSION IF NOT EXISTS citext;"
# save crypto functions
sudo -u postgres psql -d mapx -f $dirDbInit/crypto.sql
service postgresql restart 
# save receipts

