#!/bin/bash

sudo docker images mesosphere/dcos-genconf --format="{{.ID}}" | xargs -r -n 1 docker rmi
#sudo docker rmi mesosphere/dcos-ca-devkit:nozkvfs
