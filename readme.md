# nextcloud-AIO-Traefik

sed 's/aaa@bbb.ccc/your@email.com/' traefik.yml
sed 's/hostname.domain.TLD/your.domain.com/' config/nextcloud.yml

docker network create --driver=bridge proxy
docker network create --driver=bridge nextcloud-aio

docker-compose -f docker-compose-traefik.yml up -d
docker-compose -f docker-compose-nextcloud_aio.yml up -d
