# Cook Docker

A few scripts to get a cook cluster started, along with mesos, zookeeper and marathon. It makes use of [minimesos](http://minimesos.readthedocs.org/en/0.8.0) to get the mesos cluster started.

The scripts below assume you have docker installed. If you do not, first follow https://docs.docker.com/linux/step_one/.

`bin/prepare-docker` will build the docker image specifed by docker-cook/Dockerfile

`bin/setup.sh` will pull down minimesos if you don't have it, start a minimesos cluster and then start cook to connect to the cluster as a framework.
