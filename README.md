# Apache Hadoop 2.7.1 Docker Image

## 1. 编译容器

```bash
$ ./build.sh
```

## 2. 运行并登入容器

```bash
$ docker run -it -P hadoop-learn /etc/bootstrap.sh -bash
```

注：如果是从dockerhub上使用build好的container，就忽略上面两步，直接运行：

```bash
$ docker run -it -P weli/hadoop-learn:latest /etc/bootstrap.sh -bash
```

<p align="center"> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ </p>

### { 跑hadoop自带的例子 }

```bash
$ cd $HADOOP_PREFIX
$ bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.1.jar grep input output 'dfs[a-z.]+'
```

查看数据处理结果：

```bash
$ bin/hdfs dfs -cat output/*
```

<p align="center"> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ </p>

### { 跑hadoop-book的例子 }

执行脚本：

```bash
$ /root/run_example.sh
```

<p align="center"> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ </p>

### { hdfs tree的例子 }

命令：

```bash
bash-4.4# /root/tree.sh
```

```bash
+ cd /root/hdfs-tree
+ bin/hdfs-tree -r hdfs://2280e24e3dd1:9000/
19/01/14 05:01:44 WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
hdfs://2280e24e3dd1:9000/
├── [      74KB] user
	├── [      74KB] root
		├── [      74KB] input
			├── [      10KB] log4j.properties
			├── [       9KB] hadoop-policy.xml
			├── [       5KB] kms-site.xml
			├── [       4KB] yarn-env.sh
			├── [       4KB] capacity-scheduler.xml
├── [        0B] tmp
	├── [        0B] hadoop-yarn
		├── [        0B] staging
			├── [        0B] history
				├── [        0B] done
				├── [        0B] done_intermediate
bash-4.4#
```

∎
