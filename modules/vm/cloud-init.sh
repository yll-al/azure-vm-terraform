#!/bin/bash

set -e

apt-get update -y

apt-get install -y git docker.io curl

systemctl enable docker
systemctl start docker

docker pull nginx:latest
docker run -d --restart unless-stopped -p 80:80 --name nginx-server nginx
