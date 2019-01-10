# Apache Hadoop 2.7.1 Docker Image

## 1. 编译容器

```bash
$ ./build.sh
```

## 2. 运行并登入容器

```bash
$ docker run -it -P hadoop-learn /etc/bootstrap.sh -bash
```

## 3. 跑hadoop自带的例子

```bash
$ cd $HADOOP_PREFIX
$ bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.1.jar grep input output 'dfs[a-z.]+'
```

查看数据处理结果：

```bash
$ bin/hdfs dfs -cat output/*
```

## 4. 跑hadoop-book的例子
执行脚本：

```bash
$ /root/run_example.sh
````

∎