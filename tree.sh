#!/bin/sh
set -x

cd /root/hdfs-tree
bin/hdfs-tree -r hdfs://$HOSTNAME:9000/
