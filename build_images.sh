#!/bin/bash

images="
openolitor-client-admin
openolitor-client-kundenportal
openolitor-server
"

BUILDDATE=$(date --iso-8601=s)

for image in ${images}; do
  cd ${image}
  VERSION=$(grep "^ENV VERSION" Dockerfile | cut -d' ' -f3)
  sed "s/MYBUILDDATE/${BUILDDATE}/g" Dockerfile >Dockerfile.build
  ( docker build -t "$(basename $PWD):latest" -t "$(basename $PWD):${VERSION}" --build-arg BUILDDATE=${BUILDDATE} -f Dockerfile.build . && \
    rm Dockerfile.build ) &
  cd -
done
