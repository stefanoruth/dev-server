#!/bin/bash

folder="$(pwd)/$(dirname $0)"

source $folder/scripts/constants.sh

codePath=$(pwd)

if [[ "$(docker images -q $image:$tag 2> /dev/null)" == "" ]]; then
    source $folder/build-image.sh
fi

echo "Connecting to server."

docker run --rm -it --volume $codePath:/code --name $container $image:$tag
