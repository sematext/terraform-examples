#! /bin/bash

# Install precursors
yum update
yum install -y gcc-c++ make git
yum clean all
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
yum install -y nodejs

# Install Infra Agent
sudo wget https://pub-repo.sematext.com/centos/sematext.repo -O /etc/yum.repos.d/sematext.repo
sudo yum clean all
sudo yum install sematext-agent

# Install Sematext node.js Agent - note this could also be sematext-agent-express
# For this example spm-agent-nodejs is used as we can use this without code modification
 npm install spm-agent-nodejs -g

# Install your public side app - in this case an example graphql server
git clone https://github.com/apollographql/starwars-server
cd starwars-server
npm install

# To run, after configuration
# node -r 'spm-agent-nodejs' server.js

# ... other intial deployments
