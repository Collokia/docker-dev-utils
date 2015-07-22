# docker-ubuntu-with-dev-utils

Docker base build with all dev utilities under /opt/ including all versions of JDK's we use.   Works as a good base image for Bamboo server since the directories are correct for what it or an agent expects by default.

As per https://confluence.atlassian.com/display/BAMBOO/stock+images

See Dockerfile for which software from that list is installed.  But it looks something like this...

Oracle JDK 6, 7, 8 installed to default locations, and also symlinked from `/opt/jdk-6`, `/opt/jdk-7`, `/opt/jdk-8` as Bamboo expects.  Open JDK 6, 7 as well.  All dev tools under `/opt` where Bamboo likes them:

```
$ ls /opt
ant -> /opt/ant-1.9
ant-1.8 -> /opt/apache-ant-1.8.4
ant-1.9 -> /opt/apache-ant-1.9.5
apache-ant-1.8.4
apache-ant-1.9.5
apache-maven-3.2.1
apache-maven-3.3.3
gradle -> /opt/gradle-2.5
gradle-2.3
gradle-2.4
gradle-2.5
jdk-6 -> /usr/lib/jvm/java-6-oracle
jdk-7 -> /usr/lib/jvm/java-7-oracle
jdk-8 -> /usr/lib/jvm/java-8-oracle
maven -> /opt/maven-3.3
maven-3.3 -> /opt/maven-3.3.3
maven-3.3.3
open-jdk-6 -> /usr/lib/jvm/java-1.6.0-openjdk-amd64
open-jdk-7 -> /usr/lib/jvm/java-1.7.0-openjdk-amd64
```
