#!/usr/bin/env bash

docker pull weli/hadoop-learn
docker pull weli/hadoop-oozie
docker-compose up --force-recreate --build

