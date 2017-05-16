#!/bin/bash

cat $dirConfig/shiny/shiny-server.conf > /etc/shiny-server/shiny-server.conf
service shiny-server restart
