FROM debian:jessie
MAINTAINER Sam Mcleod <@s_mcleod>

RUN apt-get update && apt-get install -y python git-core
RUN git clone https://github.com/RuudBurger/CouchPotatoServer.git /CouchPotatoServer

VOLUME /config
VOLUME /data

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

EXPOSE 5050

RUN apt-get autoremove &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* &&\
    rm -rf /tmp/*

CMD ["/start.sh"]
