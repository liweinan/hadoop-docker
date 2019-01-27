#!/usr/bin/env bash
set -x

docker cp ~/.ssh/id_rsa.pub hadoop-docker_hadoop_1:/tmp/host_id
docker exec -it hadoop-docker_hadoop_1 bash -c "cat /tmp/host_id >> /root/.ssh/authorized_keys && cat /root/.ssh/authorized_keys"