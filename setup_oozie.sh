#!/usr/bin/env bash
set -x

docker cp hadoop-docker_oozie_1:/root/.ssh/id_rsa.pub /tmp/oozie_id
docker cp /tmp/oozie_id hadoop-docker_hadoop_1:/tmp/
docker exec -it hadoop-docker_hadoop_1 bash -c "cat /tmp/oozie_id >> /root/.ssh/authorized_keys && cat /root/.ssh/authorized_keys"

 docker exec -it hadoop-docker_hadoop_1 bash -c "cd /usr/local/hadoop-2.7.1/etc && tar czvf hadoop.tgz hadoop"
 docker exec -it hadoop-docker_hadoop_1 bash -c "ls /usr/local/hadoop-2.7.1/etc"
 docker cp hadoop-docker_hadoop_1:/usr/local/hadoop-2.7.1/etc/hadoop.tgz /tmp
 docker cp /tmp/hadoop.tgz hadoop-docker_oozie_1:/tmp
 docker exec -it hadoop-docker_oozie_1 bash -c "mv /tmp/hadoop.tgz /opt && cd /opt && tar zxvf hadoop.tgz"
 docker exec -it hadoop-docker_oozie_1 bash -c "ls /opt/hadoop"

 #docker exec -it hadoop-docker_oozie_1 bash -c "oozied.sh start"

