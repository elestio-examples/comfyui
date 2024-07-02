#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 90s;


docker-compose down;
docker-compose up -d;

sleep 20s;

target=$(docker-compose supervisor 8188);
curl http://${target}

sleep 300s;

docker-compose down;
docker-compose up -d;