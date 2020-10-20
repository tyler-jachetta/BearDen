#!/usr/bin/env bash

ROOTDIR="$(dirname $0)"

# ToDo: bootstrap playbook

# Install ansible
sudo apt update
sudo apt install -y software-properties-common
sudo apt install -y openssh-server
sudo apt install -y python3-pip

sudo pip3 install ansible

# Create ssh keys and copy pubkey to authorized keys
ssh-keygen -b 384 -t ecdsa -q -N "" -f ~/.ssh/id_ecdsa
cat ~/.ssh/id_ecdsa.pub >> ~/.ssh/authorized_keys
cat ~/.ssh/id_ecdsa.pub | sudo tee /root/.ssh/authorized_keys

cd ansible
ansible-playbook -K playbooks/den.yml 