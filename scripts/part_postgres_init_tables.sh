#!/bin/bash

sudo -u postgres psql -d mapx -f $dirDbInit/tables.sql

# Give select privilege on ALL existing table to mapxr
sudo -u postgres psql -d mapx -c "GRANT SELECT ON ALL TABLES IN SCHEMA public TO mapxr"

# restart postgres
service postgresql restart

