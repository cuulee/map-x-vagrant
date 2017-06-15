#! /bin/bash

for f in scripts/part_*
do
  receipt=$(basename $f .sh)
  touch data/receipts/$receipt
done

