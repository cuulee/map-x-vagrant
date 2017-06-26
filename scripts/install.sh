#!/bin/bash

# exit on error
set -e

#
# non interactive only
#
export DEBIAN_FRONTEND=noninteractive;

#
# Set variables used INSIDE THE GUEST
#
echo "Set variables"
dirDownload="/home/vagrant/downloads"
dirShared="/vagrant"
dirReceipts=$dirShared"/data/receipts"
dirDumps=$dirShared"/data/postgres"
dirConfig=$dirShared"/config"
dirScripts=$dirShared"/scripts"
dirDbInit=$dirConfig"/postgres"
dirpwd=$dirShared"/data/passwords"
dirNode="/home/node"
dirNodeApp=$dirNode"/app"
dirVt=$dirNodeApp"/vt"
dirShinyApp="/srv/shiny-server"
dirMapxLanding=$dirShinyApp"/home"
nMapxWorkers=10

#
# Source helpers functions
#
source $dirScripts"/prepare.sh"
source $dirScripts"/helper.sh"

if [[ ! -e $dirConfig"/credentials/credentials.sh" ]]; then echo "Please fill credentials/credentials.sh file"; fi;

source $dirConfig"/credentials/credentials.sh"


#
# Set directory if needed
#

# tools directory : where to install mapx tools..
mkdir -p $dirNodeApp
# shiny app
mkdir -p $dirShinyApp 
# shiny landing page
mkdir -p $dirMapxLanding
# downloaded app to install dir.
mkdir -p $dirDownload

#
#  Install app parts
#

# add sources
sourceOrSkip part_apt_sources

# If aptsource file does not exists, instal
sourceOrSkip part_apt_depedencies

# configure postfix
sourceOrSkip part_postfix

# Node manager
sourceOrSkip part_node_manager

# Set node user and pm2 as a service
sourceOrSkip part_pm2

# Config postgres
sourceOrSkip part_postgres_init

# Set / update postgres password
sourceOrSkip part_postgres_set_pwd

# Postgre init tables
sourceOrSkip part_postgres_init_tables

# Postgres import dump
sourceOrSkip part_postgres_import_dump

# R minimal packages
sourceOrSkip part_r_packages

# Install shiny server
sourceOrSkip part_shiny_server

# Shiny server configuration
sourceOrSkip part_shiny_server_config

# Install vt
sourceOrSkip part_vt

# Install mapx landing page:
sourceOrSkip part_mapx_landing

# Install mapx:
sourceOrSkip part_mapx

# install gist
#sourceOrSkip part_gist

# Nginx config
sourceOrSkip part_nginx_config

# Gdal binary from source
sourceOrSkip part_gdal

printMsg "Done."


