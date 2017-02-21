FROM mesosphere/mesos:1.0.1-rc1

RUN apt-get -y update 
RUN apt-get -y install curl
RUN apt-get -y install git

# java setup
RUN apt-get -y install default-jdk

# Env setup
ENV HOME "/root/"
ENV LEIN_ROOT true # Remove if we change to run as non-root

# Mesos env setup
ENV MESOS_NATIVE_JAVA_LIBRARY /usr/lib/libmesos.so

# Lein Setup 
RUN mkdir $HOME/bin
ENV PATH $PATH:$HOME/bin
RUN curl -o $HOME/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
RUN chmod a+x $HOME/bin/lein
RUN lein

# Cook
RUN git clone https://github.com/twosigma/Cook.git $HOME/Cook
RUN cd $HOME/Cook/scheduler && lein uberjar
COPY template-cook-config.edn $HOME/Cook/scheduler
COPY start-cook $HOME/Cook/scheduler/bin/start-cook
RUN chmod +x $HOME/Cook/scheduler/bin/start-cook
RUN apt-get install uuid-runtime
COPY sample_launch.sh $HOME/Cook/scheduler/bin/sample_launch.sh
