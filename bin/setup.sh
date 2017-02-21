#/bin/bash

if [ ! -d "$HOME/.minimesos/bin" ]; then
    curl -sSL https://minimesos.org/install | sh
fi

export PATH=$PATH:$HOME/.minimesos/bin

if [ ! -f minimesosFile ]; then
    minimesos init
fi

minimesos up 
$(minimesos info | tail -n 5) # Get necessary environment vars
docker run -it docker-cook /root/Cook/scheduler/bin/start-cook ${MINIMESOS_ZOOKEEPER%;} # this removes the trailing ';'
