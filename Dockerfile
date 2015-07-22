FROM ubuntu:15.04

ENV APACHE_ANT_1_8_VERSION=1.8.4 \
    APACHE_ANT_1_9_VERSION=1.9.5 \
    ANT_CURRENT=1.9 \
    GRADLE_2_3_VERSION=2.3 \
    GRADLE_2_4_VERSION=2.4 \
    GRADLE_2_5_VERSION=2.5 \
    GRADLE_CURRENT=2.5 \
    MAVEN_3_3_VERSION=3.3.3 \
    MAVEN_CURRENT=3.3 \
    ANT_HOME=/opt/ant \
    GRADLE_HOME=/opt/gradle \
    MAVEN_HOME=/opt/maven 

VOLUME "/root/.docker"

RUN mkdir -p /tmp/build /opt \
      && echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
      && echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
      && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
      && apt-get -y install --allow-unauthenticated --no-install-recommends software-properties-common \
      && add-apt-repository -y ppa:webupd8team/java \
      && apt-get -y update \
      && apt-get -y install --allow-unauthenticated --no-install-recommends  \
                        openssh-client+ \
			wget \
			curl \
			unzip \
			python \
                      	git+ \
			node.js+ \
			openjdk-6-jdk+ \
			openjdk-7-jdk+ \
			oracle-java6-installer+ \
			oracle-java7-installer+ \
			oracle-java8-installer+ \
      && update-java-alternatives -s java-8-oracle \
      && ln -s /usr/lib/jvm/java-6-oracle /opt/jdk-6 \
      && ln -s /usr/lib/jvm/java-7-oracle /opt/jdk-7 \
      && ln -s /usr/lib/jvm/java-8-oracle /opt/jdk-8 \
      && ln -s /usr/lib/jvm/java-1.6.0-openjdk-amd64 /opt/open-jdk-6 \
      && ln -s /usr/lib/jvm/java-1.7.0-openjdk-amd64 /opt/open-jdk-7 \
      && echo "Install Ant 1.8.x" \
      && wget http://archive.apache.org/dist/ant/binaries/apache-ant-${APACHE_ANT_1_8_VERSION}-bin.tar.gz -O /tmp/build/apache-ant-${APACHE_ANT_1_8_VERSION}-bin.tgz \
      && tar -xzf /tmp/build/apache-ant-${APACHE_ANT_1_8_VERSION}-bin.tgz -C /opt \
      && ln -s /opt/apache-ant-${APACHE_ANT_1_8_VERSION} /opt/ant-1.8 \
      && echo "Install Ant 1.9.x" \
      && wget http://archive.apache.org/dist/ant/binaries/apache-ant-${APACHE_ANT_1_9_VERSION}-bin.tar.gz -O /tmp/build/apache-ant-${APACHE_ANT_1_9_VERSION}-bin.tgz \
      && tar -xzf /tmp/build/apache-ant-${APACHE_ANT_1_9_VERSION}-bin.tgz -C /opt \
      && ln -s /opt/apache-ant-${APACHE_ANT_1_9_VERSION} /opt/ant-1.9 \
      && echo "Link current Ant" \
      && ln -s /opt/ant-${ANT_CURRENT} /opt/ant \
      && echo "Install Gradle 2.3.x" \
      && wget https://services.gradle.org/distributions/gradle-${GRADLE_2_3_VERSION}-bin.zip -O /tmp/build/gradle-${GRADLE_2_3_VERSION}-bin.zip \
      && unzip -o -d /opt/ /tmp/build/gradle-${GRADLE_2_3_VERSION}-bin.zip \
      && echo "Install Gradle 2.4.x" \
      && wget https://services.gradle.org/distributions/gradle-${GRADLE_2_4_VERSION}-bin.zip -O /tmp/build/gradle-${GRADLE_2_4_VERSION}-bin.zip \
      && unzip -o -d /opt/ /tmp/build/gradle-${GRADLE_2_4_VERSION}-bin.zip \
      && echo "Install Gradle 2.5.x" \
      && wget https://services.gradle.org/distributions/gradle-${GRADLE_2_5_VERSION}-bin.zip -O /tmp/build/gradle-${GRADLE_2_5_VERSION}-bin.zip \
      && unzip -o -d /opt/ /tmp/build/gradle-${GRADLE_2_5_VERSION}-bin.zip \
      && echo "Link current Gradle" \
      && ln -s /opt/gradle-${GRADLE_CURRENT} /opt/gradle \
      && echo "Install Maven 3.3.x" \
      && wget http://archive.apache.org/dist/maven/maven-3/${MAVEN_3_3_VERSION}/binaries/apache-maven-${MAVEN_3_3_VERSION}-bin.tar.gz -O /tmp/build/maven-${MAVEN_3_3_VERSION}-bin.tar.gz \
      && tar -xzf /tmp/build/maven-${MAVEN_3_3_VERSION}-bin.tar.gz -C /opt \
      && ln -s /opt/maven-${MAVEN_3_3_VERSION} /opt/maven-3.3 \
      && echo "Link current Maven" \
      && ln -s /opt/maven-${MAVEN_CURRENT} /opt/maven \
      && echo "Install Amazon AWS CLI" \
      && curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o /tmp/build/awscli-bundle.zip \
      && unzip -o -d /tmp/build /tmp/build/awscli-bundle.zip \
      && /tmp/build/awscli-bundle/install -i /usr/local/bin/aws \
      && echo "Install Docker" \
      && wget -qO- https://get.docker.com/ | sh \
      && echo "Cleanup" \
      && apt-get purge -y python-software-properties software-properties-common \
      && apt-get autoremove -y \
      && apt-get clean -y \
      && rm -rf /tmp/* /var/tmp/* \
      && rm -rf /var/cache/oracle* 
