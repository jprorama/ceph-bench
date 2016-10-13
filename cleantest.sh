#!/bin/bash

# remove the test files created on the TLD of the OSD

osdlist=`df -h | awk -F\- '/ceph\/osd\/ceph-/{print $2}' | xargs echo`

for osd $osdlist
do
  rm /var/lib/ceph/osd/ceph-$osd/testbig 
done

