#!/bin/bash
set -x

export ETCD_PORT=${ETCD_PORT:-4001}
export HOST_IP=${HOST_IP:-127.0.0.1}
export ETCD=$HOST_IP:4001

if [ "$1" = "nginx" ]; then
  echo "[nginx] starting nginx..."
  confd -onetime -node $ETCD -config-file /etc/confd/conf.d/nginx.toml
  confd -watch -node $ETCD -config-file /etc/confd/conf.d/nginx.toml &
  exec /usr/sbin/nginx
fi

exec "$@"
