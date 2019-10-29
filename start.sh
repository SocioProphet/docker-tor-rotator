#!/bin/sh

for i in $(seq 1 20); do
  port=$((9050 + $i))
  echo "i is $i and port is $port"
  tor --SocksPort $port \
      --MaxCircuitDirtiness 10 \
      --PidFile /var/run/tor/$i.pid \
      --RunAsDaemon 1 \
      --Log "info file /var/log/tor/$i.log" \
      --DataDirectory /var/db/tor/$i
done

haproxy -f /etc/default/haproxy.conf -q -db
