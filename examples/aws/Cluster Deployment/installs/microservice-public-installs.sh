#! /bin/bash
yum update
yum install -y gcc-c++ make
yum clean all
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
yum install -y nodejs
sudo npm i -g npm install spm-agent-nodejs


# ... other intial deployments

# TODO -  install atom alonmg with script?
