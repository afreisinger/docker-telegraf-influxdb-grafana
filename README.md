# Monitoring Docker service with Telegraf and InfluxDB


## Versions

* InfluxDB:          2.3.0
* Telegraf :         1.23
* Postgres:          14.2.0
* Grafana:           9.0.2


## Quick Start

First download and install the latest available version of Docker Compose <https://docs.docker.com/compose/install/>

In order to start the service the first time launch:

```sh
COMPOSE_PROFILES=grafana,telegraf docker-compose up -d
```

You can replace `COMPOSE_PROFILES=grafana,telegraf` with the desired profiles to launch, you can launch only InfluxDB (default with no profiles).

To stop the service launch:

```sh
COMPOSE_PROFILES=grafana,telegraf docker-compose down
```

## Mapped Ports

```
Host		Container		Service

3000		3000			grafana
8086		8086		 influxdb
8125		8125			statsd
```

## Grafana

Open <http://localhost:3000>

```
Username: admin
Password: admin
```

### Data source on Grafana

InfluxDB data source is automatically provisioned with new Flux language support flag.

## InfluxDB

### Web Interface

Open <http://localhost:8086>

```
Username: admin
Password: admin123456
Port: 8086
```

## Customizations

You can customize all settings in the attached config files, then you can stop and start the service in order to reload the new configurations.

 
## Example Docker Monitoring Dashboard

### Set enviroment
```
./export_env
```

### Conducts initial InfluxDB using the CLI and create 'docker' bucket
```
docker exec -it influxdb /bin/sh 
influx setup --skip-verify --bucket ${DOCKER_INFLUXDB_INIT_BUCKET} --retention ${DOCKER_INFLUXDB_INIT_RETENTION} --token ${DOCKER_INFLUXDB_INIT_ADMIN_TOKEN} --org ${DOCKER_INFLUXDB_INIT_ORG} --host http://${DOCKER_INFLUXDB_INIT_HOST}:8086 --force

```

### Import Dashboard template on Influxdb
```
influx apply -f https://raw.githubusercontent.com/influxdata/community-templates/master/docker/docker.yml --token ${DOCKER_INFLUXDB_INIT_ADMIN_TOKEN} --org ${DOCKER_INFLUXDB_INIT_ORG} --host http://${DOCKER_INFLUXDB_INIT_HOST}:8086 --force true
```

Go to Dashboards on Influx UI, and you can see a Docker link to visualization.
You can export query to grafana, too. A grafana container is running.

### Templates

* [Linux Monitoring Template](https://www.influxdata.com/influxdb-templates/linux/)
* [InfluxDB Templates Gallery](https://www.influxdata.com/products/influxdb-templates/gallery/)
