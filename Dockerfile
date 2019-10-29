FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y libevent-dev
RUN apt-get install -y libssl-dev
RUN apt-get install -y htop
RUN apt-get install -y iotop
RUN apt-get install -y tmux
RUN apt-get install -y curl
RUN apt-get install -y g++
RUN apt-get install -y tor
RUN apt-get install -y haproxy

ADD ./haproxy.conf /etc/default/haproxy.conf

RUN for i in $(seq 1 20); do mkdir -p /var/db/tor/$i; done
RUN mkdir /var/run/tor
ADD start.sh /
RUN chmod +x /start.sh

EXPOSE 9100

CMD ["./start.sh"]
