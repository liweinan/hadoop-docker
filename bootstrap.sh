#!/bin/bash
set -x

: ${HADOOP_PREFIX:=/usr/local/hadoop}

$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

export PATH=$HADOOP_PREFIX/bin/:$HADOOP_PREFIX/sbin/:$PATH
 
rm -rf /tmp/*.pid

# installing libraries if any - (resource urls added comma separated to the ACP system variable)
cd $HADOOP_PREFIX/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp; curl -LO $cp ; done; cd -

# altering the core-site configuration
sed s/HOSTNAME/$HOSTNAME/ /usr/local/hadoop/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml

# setting spark defaults
# echo spark.yarn.jar hdfs:///spark/spark-assembly-1.6.1-hadoop2.6.0.jar > $SPARK_HOME/conf/spark-defaults.conf
cp $SPARK_HOME/conf/metrics.properties.template $SPARK_HOME/conf/metrics.properties

# start server
/usr/sbin/sshd -D &
$HADOOP_PREFIX/sbin/start-dfs.sh
$HADOOP_PREFIX/sbin/start-yarn.sh
# https://unix.stackexchange.com/questions/76354/who-sets-user-and-username-environment-variables/76356
$HADOOP_PREFIX/sbin/mr-jobhistory-daemon.sh start historyserver

# https://stackoverflow.com/questions/44469234/cannot-create-directory-in-hdfs-namenode-is-in-safe-mode
$HADOOP_PREFIX/bin/hdfs dfsadmin -safemode leave

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

# tail -f /dev/null

#nc -l -p 54321 -s 0.0.0.0

#if [[ $1 == "-d" ]]; then
#  while true; do sleep 1000; done
#fi
#
#if [[ $1 == "-bash" ]]; then
#  /bin/bash
#fi
 