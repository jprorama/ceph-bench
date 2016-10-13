#!/bin/bash

#
# simple write benchmark for disks used as OSDs in Ceph cluster
# designed to measure the average write throughput to help size the journal
#
# takes a test name argument to write data to a subdir and keep things clean accross multiple runs
# assumes default osd disk locations

tnum=$1
mkdir -p $tnum

osdlist=`df -h | awk -F\- '/ceph\/osd\/ceph-/{print $2}' | xargs echo`

iostat -m 3 1000 > $tnum/iostat-dd-test 2>&1 &
sleep 3
for osd in $osdlist
do
  time dd if=/dev/zero of=/var/lib/ceph/osd/ceph-$osd/testbig count=104857600 > $tnum/dd-osd-$osd 2>&1  &
done

