#!/bin/bash

pathToN=$dirDownload/n

rm -rf $pathToN
git clone --depth=1 https://github.com/tj/n.git $pathToN

cd $pathToN
make install
n 0.10.40
n 0.12.7
n 5.10.1
n 6.10.0
cd $HOME
