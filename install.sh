#!/bin/bash
set -e

#backup source.list
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cat > /etc/apt/sources.list << EOF
deb http://mirrors.aliyun.com/debian/ jessie main non-free contrib
deb http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ jessie main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib

EOF

apt-get update
apt-get install --no-install-recommends --no-install-suggests -y \
sudo ansible

cp /etc/apt/sources.list.bak /etc/apt/sources.list
rm /etc/apt/sources.list.bak
rm -rf /var/lib/apt/lists/*

echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers