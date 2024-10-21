#!/bin/bash

echo Configuration
read -p ' Email address to be used for letsencrypton traefik: ' varmail
read -p ' FQDN for nextcloud: ' varfqdn
sed -i "s/aaa@bbb.ccc/$varmail/" traefik.yml
sed -i "s/hostname.domain.TLD/$varfqdn/" dynamic/nextcloud.yml

echo Creating docker network
docker network create --driver=bridge proxy
docker network create --driver=bridge nextcloud-aio

echo Creating traefik stack with letsencrypt using email: $varmail
docker compose -p traefik -f docker-compose-traefik.yml up -d

echo Creating nextcloud stack for $varfqdn
docker compose -p nextcloud_aio -f docker-compose-nextcloud_aio.yml up -d

echo Done
echo Proced nextcloud installation on your ip:8081
echo For monitoring traefik open ip:8080