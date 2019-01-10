wget -c https://github.com/sequenceiq/docker-hadoop-build/releases/download/v2.7.1/hadoop-native-64-2.7.1.tgz
wget -c https://archive.apache.org/dist/hadoop/core/hadoop-2.7.1/hadoop-2.7.1.tar.gz
docker build -t hadoop-sandbox .
docker run -it hadoop-sandbox /etc/bootstrap.sh -bash

