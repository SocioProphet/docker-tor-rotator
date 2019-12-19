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

ARG TOR_COUNT
ENV TOR_COUNT ${TOR_COUNT:-20}
RUN for i in $(seq 1 $TOR_COUNT); do \
        port=$((9050 + $i)); \
        mkdir -p /var/db/tor/$i; \
        echo "  server 127.0.0.1:$port 127.0.0.1:$port check" >> /etc/default/haproxy.conf; \
    done

RUN mkdir /var/run/tor
ADD start.sh /
RUN chmod +x /start.sh

CMD ["./start.sh"]
