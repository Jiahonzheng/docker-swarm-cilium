#!/bin/bash

# https://docs.cilium.io/en/v1.9/gettingstarted/docker
# https://github.com/cilium/cilium/blob/v1.9.11/examples/getting-started

VERSION=v1.10.6

# Install Cilium CLI.
cid=$(docker create docker.io/cilium/cilium:$VERSION)
sudo docker cp "${cid}:/usr/bin/cilium" /usr/local/bin/cilium
docker rm -f ${cid}

sudo mount bpffs /sys/fs/bpf -t bpf

# Install Cilium Agent.
docker run \
  -d \
  --name cilium-agent \
  --restart=always \
  --network host \
  --cap-add NET_ADMIN \
  --privileged \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/run/cilium:/var/run/cilium \
  -v /sys/fs/bpf:/sys/fs/bpf \
  -v /var/run/docker/netns:/var/run/docker/netns:rshared \
  -v /var/run/netns:/var/run/netns:rshared \
  docker.io/cilium/cilium:$VERSION \
  cilium-agent \
  --ipv4-node $HOST_IP \
  --enable-ipv6=false \
  --kvstore consul --kvstore-opt consul.address=$CONSUL_IP:8500 \
  -t vxlan

# Install Cilium Docker Plugin.
docker run \
  -d \
  --name cilium-docker-plugin \
  --restart=always \
  --network host \
  --cap-add NET_ADMIN \
  --privileged \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/run/cilium:/var/run/cilium \
  -v /run/docker/plugins:/run/docker/plugins \
  docker.io/cilium/docker-plugin:$VERSION \
  cilium-docker
