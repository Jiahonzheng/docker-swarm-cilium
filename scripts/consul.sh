#!/bin/bash

docker run \
  -d \
  --name consul \
  -p 8500:8500 \
  -e 'CONSUL_LOCAL_CONFIG={"skip_leave_on_interrupt": true, "disable_update_check": true}' \
  docker.io/library/consul:1.1.0 \
  agent \
  -client=0.0.0.0 \
  -server \
  -bootstrap-expect 1
