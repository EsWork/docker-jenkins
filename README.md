[![Build Status](https://travis-ci.org/EsWork/docker-jenkins.svg?branch=master)](https://travis-ci.org/EsWork/docker-jenkins)
[![](https://images.microbadger.com/badges/image/eswork/jenkins.svg)](https://microbadger.com/images/eswork/jenkins "Get your own image badge on microbadger.com")

# Introduction

`jenkins-2.46.3` with Ansible

## Docker-outside-of-Docker Based CentOS7

```bash

mkdir -p /srv/docker/jenkins
#处理用户映射
chown -R 1000:1000 /srv/docker/jenkins

#基于docker unix socket共享

docker run -d --name jk \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(which docker):/usr/bin/docker \
-v /srv/docker/jenkins:/var/jenkins_home \
-v /lib64/libsystemd-journal.so.0:/usr/lib/libsystemd-journal.so.0 \
-v /lib64/libsystemd-id128.so.0:/usr/lib/libsystemd-id128.so.0 \
-v /lib64/libdevmapper.so.1.02:/usr/lib/libdevmapper.so.1.02 \
-v /lib64/libgcrypt.so.11:/usr/lib/libgcrypt.so.11 \
-v /lib64/libdw.so.1:/usr/lib/libdw.so.1 \
-e JAVA_OPTS=-Duser.timezone=Asia/Shanghai \ #默认UTC时区
-p 8080:8080 eswork/jenkins
```

在jenkins容器上可以使用`sudo docker images`命令访问宿主机`docker`

```bash
docker exec -it jk sudo docker images
```
