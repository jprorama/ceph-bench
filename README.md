Ceph OSD disk benchmarks

Simple benchmarking for disks used as OSDs in Ceph cluster designed 
to help answer journal size questions.

The scripts assume default osd disk locations and that they are already 
mounted and configured. This is probably bad form.

The tests are easy enough to run after intial config of 
hardware for Ceph using ceph-ansible.
