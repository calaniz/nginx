nginx
=====

Docker nginx container that auto configures itself based on keys in etcd.

Begin
=====

The overall structure of the keys is

/nginx/<app>

To configure a basic application you must provide /nginx/<app>/domain & /nginx/<app>/domain/upstream/*

Any entries inside of the `upstream` folder contain <HOST:PORT> mappings.

The container will then generate the appropriate nginx config files for teh virtual host.

