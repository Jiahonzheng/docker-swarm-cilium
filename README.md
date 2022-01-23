# Cilium on Docker Swarm

## Setup

### Install Docker Engine

```bash
vagrant ssh NODE-0 -c "bash /scripts/docker.sh"

vagrant ssh NODE-1 -c "bash /scripts/docker.sh"
```

### Install Consul

```bash
vagrant ssh NODE-0 -c "bash /scripts/consul.sh"
```

### Install Cilium

```bash
vagrant ssh NODE-0 -c "HOST_IP=192.168.56.200 CONSUL=192.168.56.200 bash /scripts/cilium.sh"

vagrant ssh NODE-1 -c "HOST_IP=192.168.56.201 CONSUL=192.168.56.200 bash /scripts/cilium.sh"
```
