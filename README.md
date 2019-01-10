# Apache Hadoop 2.7.1 Docker Image

编译并运行容器：

```bash
$ ./build.sh
```

运行容器：

```bash
$ docker run -it hadoop-sandbox /etc/bootstrap.sh -bash
```

跑例子：

```bash
$ cd $HADOOP_PREFIX
```

```bash
$ bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.1.jar grep input output 'dfs[a-z.]+'
```

查看数据处理结果：

```bash
$ bin/hdfs dfs -cat output/*
```