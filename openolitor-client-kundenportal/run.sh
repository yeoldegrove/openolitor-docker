#!/bin/bash
grunt build --env=${ENVIRONMENT} --buildnr=${BUILDDATE}
grunt -d serve
