#!/bin/bash
docker run -d --name librenms_cron \
  -v $(pwd)/data:/data \
  --env-file $(pwd)/librenms.env \
  -e "SIDECAR_CRON=1" \
  crazyquark/librenms:armhf

docker run -d -p 6060:80 --name librenms \
  -e "DB_HOST=192.168.1.94" \
  -e "DB_PORT=4306" \
  -e "DB_PASSWORD=FwBBdcwMeyKciuM7" \
  crazyquark/librenms:armhf
