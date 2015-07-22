# docker-dev-utils
Docker base build with all dev utilities under /opt/ including all versions of JDK's we use.   Works as a good base image for Bamboo server since the directories are correct for what it or an agent expects by default.

As per https://confluence.atlassian.com/display/BAMBOO/stock+images

See Dockerfile for which software from that list is installed.  But it looks something like this...

Oracle JDK 6, 7, 8 installed to default locations, and also symlinked from `/opt/jdk-6`, `/opt/jdk-7`, `/opt/jdk-8` as Bamboo expects.  Open JDK 6, 7 as well.  All dev tools under `/opt` where Bamboo likes them:

```
$ ls /opt
lrwxrwxrwx  1 root root   12 Jul 22 13:52 ant -> /opt/ant-1.9
lrwxrwxrwx  1 root root   21 Jul 22 13:52 ant-1.8 -> /opt/apache-ant-1.8.4
lrwxrwxrwx  1 root root   21 Jul 22 13:52 ant-1.9 -> /opt/apache-ant-1.9.5
drwxr-xr-x  6 root root 4096 May 22  2012 apache-ant-1.8.4
drwxr-xr-x  6 root root 4096 May 31 14:01 apache-ant-1.9.5
drwxr-xr-x  6 root root 4096 Jul 22 13:53 apache-maven-3.2.1
drwxr-xr-x  6 root root 4096 Jul 22 13:53 apache-maven-3.3.3
lrwxrwxrwx  1 root root   15 Jul 22 13:53 gradle -> /opt/gradle-2.5
drwxr-xr-x  6 root root 4096 Feb 16 06:16 gradle-2.3
drwxr-xr-x  6 root root 4096 May  5 10:16 gradle-2.4
drwxr-xr-x  6 root root 4096 Jul  8 09:47 gradle-2.5
lrwxrwxrwx  1 root root   26 Jul 22 13:52 jdk-6 -> /usr/lib/jvm/java-6-oracle
lrwxrwxrwx  1 root root   26 Jul 22 13:52 jdk-7 -> /usr/lib/jvm/java-7-oracle
lrwxrwxrwx  1 root root   26 Jul 22 13:52 jdk-8 -> /usr/lib/jvm/java-8-oracle
lrwxrwxrwx  1 root root   14 Jul 22 13:53 maven -> /opt/maven-3.3
lrwxrwxrwx  1 root root   16 Jul 22 13:53 maven-3.3 -> /opt/maven-3.3.3
drwxr-xr-x  2 root root 4096 Jul 22 13:53 maven-3.3.3
lrwxrwxrwx  1 root root   37 Jul 22 13:52 open-jdk-6 -> /usr/lib/jvm/java-1.6.0-openjdk-amd64
lrwxrwxrwx  1 root root   37 Jul 22 13:52 open-jdk-7 -> /usr/lib/jvm/java-1.7.0-openjdk-amd64
```
