# Cook Docker

A few scripts to get a cook cluster started, along with mesos, zookeeper and marathon. It makes use of [minimesos](http://minimesos.readthedocs.org/en/0.8.0) to get the mesos cluster started.

The scripts below assume you have docker installed. If you do not, first follow https://docs.docker.com/linux/step_one/.

`bin/setup.sh` will pull down minimesos if you don't have it, start a minimesos cluster and then start cook to connect to the cluster as a framework.



## Warning

bin/setup.sh may throw a docker error. We are still tracking this down. If that happens, don't fear, just do the following:

```
minimesos info 
# Note the value MINIMESOS_ZOOKEEPER, you will need it in a moment
docker -it docker-cook /bash
cd /root/Cook/scheduler
bin/start-cook <value of MINIMESOS_ZOOKEEPER here>
```

