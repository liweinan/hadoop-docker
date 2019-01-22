
<p align="center"> {{ 编译容器 }} </p>

```bash
$ ./build.sh
```

<p align="center"> {{ 运行并登入容器 }} </p>

```bash
$ docker run -it -P hadoop-learn /etc/bootstrap.sh -bash
```

注：如果是从dockerhub上使用build好的container，就忽略上面两步，直接运行：

```bash
$ docker run -it -P weli/hadoop-learn /etc/bootstrap.sh -bash
```

<p align="center"> {{ 跑hadoop自带的例子 }} </p>

```bash
$ cd $HADOOP_PREFIX
$ bin/hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.1.jar grep input output 'dfs[a-z.]+'
```

查看数据处理结果：

```bash
$ bin/hdfs dfs -cat output/*
```

<p align="center"> {{ 跑hadoop-book的例子 }} </p>

执行脚本：

```bash
$ /root/run_example.sh
```

<p align="center"> {{ hdfs tree的例子 }} </p>

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

<p align="center"> {{ 跑oozie的例子 }} </p>

首先执行[run_compose.sh](https://github.com/liweinan/hadoop-docker/blob/master/run_compose.sh)，然后登陆oozie容器：

```bash
% docker exec -it hadoop-docker_oozie_1 sh
```

然后执行：

```bash
% cd /opt/oozie-4.2.0 && oozie job -config examples/apps/map-reduce/job.properties -run
```

然后查看任务运行情况：

```bash
% oozie job -info [job_id]
```

∎
