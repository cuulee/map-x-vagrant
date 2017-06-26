#!/bin/bash

# removes all packages from the package cache
apt-get clean

# update apt-get
apt-get -qy update

# install stuff
apt-get -qy install \
  imagemagick \
  postgresql-9.5 \
  postgresql-client-9.5 \
  postgresql-9.5-postgis-2.2 \
  libpq-dev \
  unzip \
  wget \
  g++ \
  curl \
  libssl-dev \
  git-core \
  r-base \
  r-base-dev \
  libxml2-dev \
  libcurl4-gnutls-dev \
  libv8-dev \
  libgdal-dev \
  libproj-dev \
  libstdc++6 \
  nginx-extras \
  ca-certificates \
  gdb \
  gdebi-core \
  redis-server

# upgrade
apt-get -qy upgrade

