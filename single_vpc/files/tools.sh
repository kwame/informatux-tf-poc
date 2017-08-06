#!/bin/bash
yum-config-manager --enable epel
yum -y update 
wget -O /tmp/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 
/bin/mv /tmp/jq /usr/bin/
chmod +x /usr/bin/jq
terraform_url=$(curl https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*amd64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')
curl -o /tmp/terraform.zip $terraform_url
sudo unzip /tmp/terraform.zip -d /usr/local/bin
sudo -u ec2-user pip install --upgrade --user awscli
yum -y install git screen tmux ansible ansible-doc ansible-inventory-grapher ansible-lint
