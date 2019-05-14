
## !! WARNING !!

This project serves as a testbed for server configuration and ansible deployment scripts.

> This must ONLY be run locally, in a secure, controlled environment...NEVER in production.

### Features

Simulates a VM having:
- Amazon Linux 2 AMI
- systemd
- ssh*
- crond*
- nginx*
- docker (WARNING: This runs in *privileged* mode, which is a security risk for the host)
- docker-compose
- git (git-core)

*Running under `systemd`, so deploy scripts can `systemctl start|stop|status nginx`.
