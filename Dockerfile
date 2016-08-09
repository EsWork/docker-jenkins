FROM jenkins:2.7.2
MAINTAINER JohnWu "v.la@live.cn"

USER root

COPY install.sh /usr/src/install.sh
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

RUN bash /usr/src/install.sh

USER jenkins