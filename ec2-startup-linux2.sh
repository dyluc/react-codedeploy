#!/bin/sh

# update instance packages
sudo yum update -y

# move to correct directory
cd /home/ec2-user

# setup code deploy agent
sudo yum install -y ruby
sudo yum install wget
wget https://aws-codedeploy-eu-west-2.s3.eu-west-2.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent start
rm ./install -f

# install node 17 and serve
curl --silent --location https://rpm.nodesource.com/setup_17.x | bash -
yum -y install nodejs
npm install -g serve

# logs folder
mkdir logs
sudo chmod -R a+rw ./logs