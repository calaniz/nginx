#!/bin/bash

/etc/init.d/nginx start

/usr/local/bin/confd -interval=300 -verbose=true
