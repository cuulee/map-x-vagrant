#!/bin/bash


# get the last version number
SHINYVERSION=`curl https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/VERSION`
# Get deb
wget --no-verbose "https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/shiny-server-$SHINYVERSION-amd64.deb" -O $dirDownload/shiny-server-latest.deb
gdebi -n $dirDownload/shiny-server-latest.deb
rm -f $dirDownload/shiny-server-latest.deb

if [[ -e "$dirShinyApp/sample-apps" ]]
then 
  rm -rf "$dirShinyApp/sample-apps"
fi

