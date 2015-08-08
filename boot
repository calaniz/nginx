#!/bin/bash
set -x

export ETCD_PORT=${ETCD_PORT:-4001}
export HOST_IP=${HOST_IP:-127.0.0.1}
export ETCD=$HOST_IP:4001

if [ "$1" = "nginx" ]; then
  echo "[nginx] starting nginx..."
  confd -watch -node $ETCD &
  exec /usr/sbin/nginx
fi

exec "$@"
