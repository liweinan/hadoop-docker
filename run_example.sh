#!/bin/sh
set -x

$HADOOP_PREFIX/bin/hadoop fs -copyFromLocal /root/hadoop-book/input /input2
$HADOOP_PREFIX/bin/hadoop fs -ls /input2/ncdc/sample.txt
$HADOOP_PREFIX/bin/hadoop jar /root/hadoop-book/ch02-mr-intro/target/ch02-mr-intro-4.0.jar MaxTemperature /input2/ncdc/sample.txt /output2
$HADOOP_PREFIX/bin/hadoop fs -ls /output2
$HADOOP_PREFIX/bin/hadoop fs -cat /output2/part-r-00000
