#!/bin/bash
echo "Do you want to install kube[Y/n]"
read askPrompt

if [[ $askPrompt = y ]]
then
#Start of then in if
if [[ $(command -v curl) ]] && [[ $askPrompt = y ]]
then
sudo apt update
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
echo "Want to check the checksum?"
read askPromptCheckSum
#end of then in if
else 
sudo apt install curl -y
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
echo "Want to check the checksum?"
read askPromptCheckSum
#end of else in if
fi
if [[ $askPromptCheckSum = y ]]
then
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(<kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
clear
echo "Wait clearing files"
sleep 2
sudo rm ./kubectl
sudo rm ./kubectl.sha256
sudo rm -rf ./installKuber.sh
history -c
#end of then in if
else echo "checksum check canclled by user"
sudo rm ./kubectl
sudo rm ./kubectl.sha256
#end of else in if
fi
else echo "canclled by user!"
fi
