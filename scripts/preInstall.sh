#set env vars
set -o allexport; source .env; set +o allexport;

lshw_output=$(lshw)

if [[ $lshw_output == *nvidia* ]]; then
    echo "Installing the GPU version..."
    # SOFTWARE_VERSION_TAG=latest
    SOFTWARE_VERSION_TAG=pytorch-2.0.1-py3.10-cuda-11.8.0-base-22.04
    sed -i 's/#deploy:/deploy:/g' ./docker-compose.yml
    sed -i 's/#  resources:/  resources:/g' ./docker-compose.yml
    sed -i 's/#    reservations:/    reservations:/g' ./docker-compose.yml
    sed -i 's/#      devices:/      devices:/g' ./docker-compose.yml
    sed -i 's/#        - driver: nvidia/        - driver: nvidia/g' ./docker-compose.yml
    sed -i 's/#          count: all/          count: all/g' ./docker-compose.yml
    sed -i 's/#          capabilities: \[gpu\]/          capabilities: \[gpu\]/g' ./docker-compose.yml
else
    echo "Installing the CPU version..."
    # SOFTWARE_VERSION_TAG=latest-cpu
    SOFTWARE_VERSION_TAG=pytorch-2.0.1-py3.10-cpu-22.04
fi


cat << EOT >> ./.env

SOFTWARE_VERSION_TAG=${SOFTWARE_VERSION_TAG}
EOT