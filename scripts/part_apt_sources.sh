#!/bin/bash

# Dev toolchain 
addToAptSource \
  "deb http://ppa.launchpad.net/ubuntu-toolchain-r/test/ubuntu trusty main" \
  "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x1E9377A2BA9EF27F"

# POSTGRES
addToAptSource \
  "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" \
  "http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc"

# R
addToAptSource \
  "deb http://cran.univ-lyon1.fr/bin/linux/ubuntu trusty/" \
  "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xE084DAB9"

# NGINX
addToAptSource \
  "deb http://ppa.launchpad.net/nginx/stable/ubuntu trusty main" \
  "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x00A6F0A3C300EE8C"
