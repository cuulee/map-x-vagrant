#! /bin/bash


#
# simple way to add repository (not in a ppa: form) and add corresponding key.
# add-apt-repository can handle custom repo, but the key server option did not always work.
# So, going on with a simple script.
#
function addToAptSource
{
  set -e
  if [ `grep "$1" /etc/apt/sources.list | wc -l` -eq 0 ]
  then
    echo "Add $1 to sources list"
    # add new source to apt source.list
    echo $1 >> /etc/apt/sources.list
    # if a second argument is given (the key url), add it with apt-key
    if [ `echo $2 | wc -l ` -ne 0 ];
    then
      echo "Add $2 to keys"
      wget $2 -O key
      apt-key add key
      rm key
    else
      echo "No key given for $1"
    fi
  else
    echo "$1 seems to be already present in sources. skipping"
  fi
}

# print a message to console with 
function printMsg 
{
  echo $(for i in $(seq 1 80);do echo -n "-";done;);  
  echo $1;
  echo $(for i in $(seq 1 80);do echo -n "-";done;);
}

# getPassword
# create or read password in/from a file
# usage getPassword <fileToWrite>
function getPassword
{ 
  if [ -e $1 ]
  then 
    pwd=$(cat $1)
  else
    pwd=$(</dev/urandom tr -dc '{}?!$POIULKJHMNBpoiulkjhmnb0123456789' | head -c10; echo "")
    echo $pwd > $1 
  fi
  echo $pwd;
}


function sourceOrSkip
{
if [[ ! -e $dirReceipts/$1 ]]
then
  printMsg "Load $1"
  source $dirScripts/$1.sh
  touch $dirReceipts/$1
else
  printMsg "$1 already loaded. Delete $dirReceipts/$1 if needed"
fi
}



