#!/bin/bash

sudo -u postgres psql -d mapx -f $dirDumps/mapx.sql
sudo -u postgres psql -d mapx -c "GRANT SELECT ON ALL TABLES IN SCHEMA public TO mapxr;"
