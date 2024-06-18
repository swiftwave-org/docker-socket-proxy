#!/bin/sh
set -e

# raise error if AUTH_TOKEN is not set
# if [ -z "$AUTH_TOKEN" ]; then
# 	echo "ERROR: AUTH_TOKEN is not set"
# 	exit 1
# fi

# replace ${AUTH_TOKEN} with the value of AUTH_TOKEN
sed "s/\${AUTH_TOKEN}/$AUTH_TOKEN/g" /usr/local/etc/haproxy/haproxy.cfg.template > /usr/local/etc/haproxy/haproxy.cfg

# start haproxy
if [ "${1#-}" != "$1" ]; then
	set -- haproxy "$@"
fi

if [ "$1" = 'haproxy' ]; then
	shift
	set -- haproxy -W -db "$@"
fi

exec "$@"