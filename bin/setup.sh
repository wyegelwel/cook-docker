#/bin/bash

if [ ! -d "$HOME/.minimesos/bin" ]; then
    curl -sSL https://minimesos.org/install | sh
    export PATH=$PATH:$HOME/.minimesos/bin
fi

minimesos init
minimesos up 
$(minimesos info | tail -n 5) # Get necessary environment vars
docker run -it docker-cook /root/Cook/scheduler/bin/start-cook $MINIMESOS_ZOOKEEPER
