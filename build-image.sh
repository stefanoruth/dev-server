#!/bin/bash

folder="$(pwd)/$(dirname $0)"

source $folder/scripts/constants.sh

echo "Building Docker Image"

docker image build -t $image $folder
