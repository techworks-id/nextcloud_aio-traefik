#!/bin/bash
echo "Removing nextcloud and traefik"
read -r -p "Are you sure? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    docker compose -p nextcloud_aio -f docker-compose-nextcloud_aio.yml down
    docker compose -p traefik -f docker-compose-traefik.yml down
    docker ps --filter name=nextcloud-aio* -aq | xargs docker container stop
    docker ps --filter name=nextcloud-aio* -aq | xargs docker container remove
    docker network remove proxy nextcloud-aio

    echo "To prevent lost of importand data, volume must be remove manualy."
    echo "If you sure want to remove all dangling volume, use command: docker volume prune -a"
    echo "Your Nextcloud data is saved using this environtmetn: "NEXTCLOUD_DATADIR: /mnt/ncdata", If you want to deploy nextcloud-aio again remove /mnt/ncdata or use other path before running setup.sh"
else
    echo "Ok then. :D"
fi

