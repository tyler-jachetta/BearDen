#!/usr/bin/env bash

ROOTDIR="$(dirname $0)"

# ToDo: bootstrap playbook

ROOT_HOME="$( sudo echo $HOME)"

# Install ansible
sudo apt update
sudo apt install -y software-properties-common
sudo apt install -y openssh-server
sudo apt install -y python3-pip

sudo pip3 install --upgrade pip
sudo pip3 install ansible

# Create ssh keys and copy pubkey to authorized keys

# Make sure that root has an ssh directory
sudo bash -c 'mkdir -p "${HOME}/.ssh"'
if [[ ! -f ~/.ssh/id_ecdsa ]]; then
  ssh-keygen -b 384 -t ecdsa -q -N "" -f ~/.ssh/id_ecdsa
fi

# Check if already in file
cat -n ~/.ssh/id_ecdsa.pub | tr -d '[:space:]' | grep -q - ~/.ssh/authorized_keys

if [[ $? -ne 0 ]]; then
  cat ~/.ssh/id_ecdsa.pub >> ~/.ssh/authorized_keys
fi

cat -n ~/.ssh/id_ecdsa.pub | tr -d '[:space:]' | sudo grep -q - "${ROOT_HOME}/.ssh/authorized_keys"
if [[ $? -ne 0 ]]; then
  cat ~/.ssh/id_ecdsa.pub | sudo tee /root/.ssh/authorized_keys
fi

cd ansible
ansible-playbook -K playbooks/den.yml 
