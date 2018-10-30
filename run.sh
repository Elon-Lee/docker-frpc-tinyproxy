#!/bin/sh -e

tinyproxy -c /etc/tinyproxy.conf

frpc -c /bin/frpc.ini
