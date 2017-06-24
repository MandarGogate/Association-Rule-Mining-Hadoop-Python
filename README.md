# Association-Rule-Mining-Hadoop-Python

Note:- Sample Data and Results are available in the Sample folder.

# Table of contents

<!-- toc -->

- [Steps to run the code:](#steps-to-run-the-code)
  * [Install Hadoop and Python](#install-hadoop-and-python)
  * [Setup Environment variables](#setup-environment-variables)
  * [Copy the Sample data into hdfs](#copy-the-sample-data-into-hdfs)
  * [Run ruleGen.sh](#run-rulegensh)
- [Project team](#project-team)
- [Course](#course)
- [Blog Post](#blog-post)

<!-- tocstop -->

## Steps to run the code:
The following instructions are tested on Ubuntu 14.04 LTS and Python 2.7
### Install Hadoop and Python

```bash
sudo apt-get -y update
sudo apt-get -y install default-jdk
ssh-keygen -t rsa -P ''
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
wget http://apache.mirror.anlx.net/hadoop/common/hadoop-2.6.1/hadoop-2.6.1.tar.gz
tar xfz hadoop-2.6.1.tar.gz

```
P.S. I am assuming that Python is already installed.
### Setup Environment variables
```bash
#Replace <user_name> or folder structure
export HADOOP_HOME=/home/<user_name>/hadoop-2.6.1
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export PATH=$PATH:$HADOOP_HOME/bin

```
### Configure Hadoop

```bash
cat >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh <<EOF
export JAVA_HOME=${JAVA_HOME}
export HADOOP_HOME=${HADOOP_HOME}
EOF

cat > $HADOOP_HOME/etc/hadoop/core-site.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://localhost:9000</value>
    </property>
</configuration>
EOF

cat > $HADOOP_HOME/etc/hadoop/hdfs-site.xml <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
</configuration>
EOF
```

### Download the code from repo
```bash
git clone https://github.com/MandarGogate/Association-Rule-Mining-Hadoop-Python.git
cd Association-Rule-Mining-Hadoop-Python/
```
### Copy the Sample data into hdfs
```bash
hdfs dfs -mkdir Sample
hdfs dfs -put ./Sample/sampledata.txt Sample/

```
### Run ruleGen.sh
```bash

./ruleGen.sh
```












## Project team
* Mandar Gogate (2012A8TS749G)
* Abhishek Srivastava(2012B4A7756G)
* Aman Ahuja (2012C6TS595G)


## Course
CS F415 Data Mining

## Blog Post
Visit https://www.mandargogate.com/association-rule-mining-in-hadoop/ ‎ for the blog post
