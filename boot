#!/bin/bash

export ETCD_PORT=${ETCD_PORT:-4001}
export HOST_IP=${HOST_IP:-127.0.0.1}
export ETCD=$HOST_IP:4001

/usr/local/bin/confd -watch -node $ETCD &

if [ "$1" = "nginx" ]; then
  exec /usr/sbin/nginx
fi

exec "$@"
