# nextcloud-aio-traefik

clone this repo https://github.com/techworks-id/nextcloud_aio-traefik.git <br/>

run setup.sh for automated container installation or run manualy using several command below. <br/>

sed -i 's/aaa@bbb.ccc/your@email.com/' docker-compose-traefik.yml <br/>
sed -i 's/hostname.domain.TLD/your.domain.com/' dynamic/nextcloud.yml <br/>

docker network create --driver=bridge proxy <br/>
docker network create --driver=bridge nextcloud-aio <br/>

docker compose -p traefik -f docker-compose-traefik.yml up -d <br/>
docker compose -p nextcloud_aio -f docker-compose-nextcloud_aio.yml up -d <br/>
