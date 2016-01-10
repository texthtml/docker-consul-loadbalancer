# docker-consul-loadbalancer

nginx loadbalancer for consul services

## Usage

running the loadbalancer:

```bash
docker run --name=lb -p 80 -e CONSUL_URL=consulhost:8500 texthtml/consul-loadbalancer
```

All services registered on your consul cluster with the tag `VHOST` will be availlable at http://<service_name>.<docker_ip>.xip.io/ (eg: http://app.127.0.0.1.xip.io/)
