#!/bin/ash
set -e
# Docker Daemon Permissions
# https://github.com/influxdata/telegraf/tree/master/plugins/inputs/docker
groupadd docker
usermod -aG docker telegraf
exec "$@"
