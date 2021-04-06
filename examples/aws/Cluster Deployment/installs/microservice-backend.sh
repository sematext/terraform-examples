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

# Install Sematext MongoDB Agent
sudo npm i spm-agent-mongodb -g

# ... other intial deployments
