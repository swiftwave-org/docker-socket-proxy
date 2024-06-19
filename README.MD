# Docker Socket Proxy

This is a simple proxy to convert unix socket of docker to tcp socket to share access to containers in same docker network. It has granular permission control to allow/deny read/write access to each endpoint.

## Credits

Inspired from [https://github.com/Tecnativa/docker-socket-proxy](https://github.com/Tecnativa/docker-socket-proxy)

As in swiftwave, we need some extra permission control to allow/deny access to each endpoint, we create this proxy to do the same.

## Environment Variables

**NOTE :**
1. Any environment variable ended with `_READ` will be used to allow read access to the endpoint. It will allow `GET` and `HEAD` request to the endpoint.
2. Any environment variable ended with `_WRITE` will be used to allow write access to the endpoint. It will allow `POST`, `PUT` and `DELETE` request to the endpoint.

**Available Environment Variables :**

| Variable Name      | Description              | Default Value        |
| ------------------ | ------------------------ | -------------------- |
| DOCKER_SOCKET_PATH | Path to docker socket    | /var/run/docker.sock |
| LOG_LEVEL          | Log level                | notice               |
| PING_READ          | Allow ping read          | 0                    |
| PING_WRITE         | Allow ping write         | 0                    |
| VERSION_READ       | Allow version read       | 0                    |
| VERSION_WRITE      | Allow version write      | 0                    |
| INFO_READ          | Allow info read          | 0                    |
| INFO_WRITE         | Allow info write         | 0                    |
| EVENTS_READ        | Allow events read        | 0                    |
| EVENTS_WRITE       | Allow events write       | 0                    |
| AUTH_READ          | Allow auth read          | 0                    |
| AUTH_WRITE         | Allow auth write         | 0                    |
| SECRETS_READ       | Allow secrets read       | 0                    |
| SECRETS_WRITE      | Allow secrets write      | 0                    |
| BUILD_READ         | Allow build read         | 0                    |
| BUILD_WRITE        | Allow build write        | 0                    |
| COMMIT_READ        | Allow commit read        | 0                    |
| COMMIT_WRITE       | Allow commit write       | 0                    |
| CONFIGS_READ       | Allow configs read       | 0                    |
| CONFIGS_WRITE      | Allow configs write      | 0                    |
| CONTAINERS_READ    | Allow containers read    | 0                    |
| CONTAINERS_WRITE   | Allow containers write   | 0                    |
| DISTRIBUTION_READ  | Allow distribution read  | 0                    |
| DISTRIBUTION_WRITE | Allow distribution write | 0                    |
| EXEC_READ          | Allow exec read          | 0                    |
| EXEC_WRITE         | Allow exec write         | 0                    |
| GRPC_READ          | Allow grpc read          | 0                    |
| GRPC_WRITE         | Allow grpc write         | 0                    |
| IMAGES_READ        | Allow images read        | 0                    |
| IMAGES_WRITE       | Allow images write       | 0                    |
| NETWORKS_READ      | Allow networks read      | 0                    |
| NETWORKS_WRITE     | Allow networks write     | 0                    |
| NODES_READ         | Allow nodes read         | 0                    |
| NODES_WRITE        | Allow nodes write        | 0                    |
| PLUGINS_READ       | Allow plugins read       | 0                    |
| PLUGINS_WRITE      | Allow plugins write      | 0                    |
| SERVICES_READ      | Allow services read      | 0                    |
| SERVICES_WRITE     | Allow services write     | 0                    |
| SESSION_READ       | Allow session read       | 0                    |
| SESSION_WRITE      | Allow session write      | 0                    |
| SWARM_READ         | Allow swarm read         | 0                    |
| SWARM_WRITE        | Allow swarm write        | 0                    |
| SYSTEM_READ        | Allow system read        | 0                    |
| SYSTEM_WRITE       | Allow system write       | 0                    |
| TASKS_READ         | Allow tasks read         | 0                    |
| TASKS_WRITE        | Allow tasks write        | 0                    |
| VOLUMES_READ       | Allow volumes read       | 0                    |
| VOLUMES_WRITE      | Allow volumes write      | 0                    |


## Usage

1. Run this docker proxy.
   ```bash
   docker run -it -p 2375:2375 -v /var/run/docker.sock:/var/run/docker.sock -e PING_READ=1 -e VERSION_READ=1 ghcr.io/swiftwave-org/docker-socket-proxy
   ```
2. Wherever you need to use this docker proxy, set `DOCKER_HOST` environment variable.
   ```bash
   export DOCKER_HOST=<docker_container_or_service_name>
   ```
3. That's it.

## Versioning

In this particular `docker-socket-proxy` project, we will maintain only `latest` tag, as this is specifically built for `swiftwave` use case. We will try to keep it backward compatible with previous version of `docker-socket-proxy`.

## License
Apache 2.0
