#!/bin/bash

# Protects script from continuing with an error
set -eu -o pipefail

source ./telegraf/telegraf.env
export $(cut -d= -f1 ./telegraf/telegraf.env)
source ./influxdb/influxdb.env
export $(cut -d= -f1 ./influxdb/influxdb.env)

# Conducts initial InfluxDB using the CLI

#influx setup --skip-verify --bucket ${DOCKER_INFLUXDB_INIT_BUCKET} --retention ${DOCKER_INFLUXDB_INIT_RETENTION} --token ${DOCKER_INFLUXDB_INIT_ADMIN_TOKEN} --org ${DOCKER_INFLUXDB_INIT_ORG} --host http://${DOCKER_INFLUXDB_INIT_HOST}:8086 --force

# https://www.influxdata.com/blog/free-linux-system-monitoring-dashboard-from-influxdb/

# Docker Monitoring
#influx apply -f https://raw.githubusercontent.com/influxdata/community-templates/master/docker/docker.yml --token ${DOCKER_INFLUXDB_INIT_ADMIN_TOKEN} --org ${DOCKER_INFLUXDB_INIT_ORG} --host http://${DOCKER_INFLUXDB_INIT_HOST}:8086 --force true


#influx setup --skip-verify --bucket ${DOCKER_BUCKET} --retention ${DOCKER_INFLUXDB_INIT_RETENTION} --token ${DOCKER_INFLUXDB_INIT_ADMIN_TOKEN} --org ${DOCKER_INFLUXDB_INIT_ORG} --host http://${INFLUXDB_INIT_HOST}:8086 --force