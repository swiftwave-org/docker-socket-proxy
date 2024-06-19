#!/bin/sh
set -e

cp /usr/local/etc/haproxy/haproxy.cfg.template /usr/local/etc/haproxy/haproxy.cfg

# start haproxy
if [ "${1#-}" != "$1" ]; then
	set -- haproxy "$@"
fi

if [ "$1" = 'haproxy' ]; then
	shift
	set -- haproxy -W -db "$@"
fi

exec "$@"