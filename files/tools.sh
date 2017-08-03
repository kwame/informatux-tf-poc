#!/bin/bash
yum -y install git ansible
terraform_url=$(curl https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*amd64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')
curl -o terraform.zip $terraform_url
unzip terraform.zip -d /usr/local/bin
sudo -u ec2-user pip install --upgrade --user awscli

