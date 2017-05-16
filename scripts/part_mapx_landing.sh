#!/bin/bash

if [[ ! -e $dirMapxLanding/index.html ]]
then
  git clone --depth=1 "https://github.com/fxi/map-x-landing.git" $dirMapxLanding
else
  cd $dirMapxLanding && su - shiny -c "git pull" && cd -
fi

chown -R shiny:shiny /srv/shiny-server

