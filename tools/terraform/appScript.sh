#!/bin/bash

#Updating and upgrading possible packages before installing docker
sudo apt upgrade -y && sudo apt update -y
sudo apt install -y docker.io

#clone git repo so we can make our docker image locally
git clone https://access-token:glpat-CzRR-GWhMuzydztPPV47@gitlab.com/kdg-ti/the-lab/teams/goeie-vraag/dotnetapp.git

cd dotnetapp
sudo docker build -t dotnetapp .
sudo docker run -d -p 80:5000 -e ASPNETCORE_ENVIRONMENT="Production"  -e connectionString="$(curl -s -H Metadata-Flavor:Google http://metadata/computeMetadata/v1/instance/attributes/connectionString)" dotnetapp


