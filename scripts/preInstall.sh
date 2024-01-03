#set env vars
set -o allexport; source .env; set +o allexport;

lshw_output=$(lshw)

if [[ $lshw_output == *nvidia* ]]; then
    echo "Installing the GPU version..."
    SOFTWARE_VERSION_TAG=latest
    sed -i 's/^#deploy:/deploy:/' ./docker-compose.yml
    sed -i 's/^#  resources:/  resources:/' ./docker-compose.yml
    sed -i 's/^#    reservations:/    reservations:/' ./docker-compose.yml
    sed -i 's/^#      devices:/      devices:/' ./docker-compose.yml
    sed -i 's/^#        - driver: nvidia/        - driver: nvidia/' ./docker-compose.yml
    sed -i 's/^#          count: all/          count: all/' ./docker-compose.yml
    sed -i 's/^#          capabilities: \[gpu\]/          capabilities: \[gpu\]/' ./docker-compose.yml
else
    echo "Installing the CPU version..."
    SOFTWARE_VERSION_TAG=latest-cpu
fi


cat << EOT >> ./.env

SOFTWARE_VERSION_TAG=${SOFTWARE_VERSION_TAG}
EOT