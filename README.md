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
