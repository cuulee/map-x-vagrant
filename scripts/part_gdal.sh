#! /bin/bash

cd $dirDownload

# get the last version number
gdalVersion=2.1.1
wget http://download.osgeo.org/gdal/$gdalVersion/gdal-$gdalVersion.tar.gz 
tar -xvf gdal-$gdalVersion.tar.gz
cd gdal-$gdalVersion
./configure
make -j 10
make install
ldconfig

cd $HOMe
