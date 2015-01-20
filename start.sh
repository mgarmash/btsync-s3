#! /bin/sh

set -e

s3fs $AWSBUCKET /s3 -ouse_cache=/tmp

[ ! -L /.sync ] && ln -sf /data /.sync

[ ! -f /data/btsync.conf ] && cat > /data/btsync.conf <<EOF
{
  "listening_port": 3369,
  "check_for_updates": false,
  "use_upnp": false,
  "webui": {
    "listen": "0.0.0.0:8888",
    "login": "admin",
    "password": "password"
  }
}
EOF

/btsync --nodaemon --config /data/btsync.conf
