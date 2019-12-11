# docker setup for openolitor

This repo provides everything to set up [openolitor](https://github.com/OpenOlitor) in docker containers.

This includes Dockerfiles for the server and client components ...

- [openolitor-server](https://github.com/OpenOlitor/openolitor-server)
  - `openolitor-server/Dockerfile`
- [openolitor-client-admin](https://github.com/OpenOlitor/openolitor-client-admin)
  - `openolitor-client-admin/Dockerfile`
- [openolitor-client-kundenportal](https://github.com/OpenOlitor/openolitor-client-kundenportal)
  - `openolitor-client-kundenportal/Dockerfile`

... build scripts to set the current varibales to config files ...

... and a `docker-compose.yml` file to get you started.

## build images

You can build the images by hand or use this script ...

`build_images.sh`

... which automatically builds and tags all the available `Dockerfile`s.

## use docker-compose

### prepare

Copy `setup.sh.template` script to `setup.sh`.
```
cp setup.sh.template setup.sh
```
Change variables in `setup.sh` and run it later.

```
./setup.sh 
```

Now you will end up with a `docker-compose.yml` and config files including your specific settings.

### run

Review `docker-compose.yml` you might need to adapt it to your network setup.

Run `docker-compose up -d` later to bring up the containers.


