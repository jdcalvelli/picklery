# picklery

pklwrks LLC website monorepo

### for all environments

requires a .env file at the root of the directory with definitions for:

- NODE_ENV
- PORT

### for development environment

ensure you have installed:

- nodejs v20.15.1
- rust v1.79.0

### for production

currently using dockerfile and docker-compose.yml to build production image

current assumption is that this application sits behind an nginx proxy, hence external network and lack of direct port mapping
