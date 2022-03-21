#!/bin/bash




echo "+------------------------------------------+"
  printf "| %-40s |\n" "`date`"
  echo "|                                          |"
  echo "$(tput setaf 1)| Harus Script                             | $(tput setab 7)$(tput sgr 0)"
  echo "+------------------------------------------+"


sleep 2



echo "Which tool to use?
 docker: 1
 Check ip: 2
 nginx: 3
 gitlab-ceHttpsOnlyUbuntu18.04: 4
 unzip files to folder /home/$USER/Downloads
 First run will download unzip and create the folder: 5"

read inputOne

if [[ $inputOne = 1  ]]
then
sudo apt-get remove docker docker-engine docker.io containerd runc

sleep 2

sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

else
echo ""
fi

if [[ $inputOne = 2 ]]
then
echo "here is your ip> $(curl -s ifconfig.me)"
else
echo ""
fi


if [[ $inputOne = 3 ]]
then
sudo apt update
sudo apt install nginx
else
echo ""
fi

if [[ $inputOne = 4 ]]
then
sudo apt update
sudo apt-get install -y curl openssh-server ca-certificates tzdata perl -y

sleep 2

#add gitlab repo
sudo apt update
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt update

#enter host name for gitlab instance
clear
echo "enter hostname <example.com>"
read inputDNSname

#Start installation of gitlab-ce

sudo EXTERNAL_URL="https://$inputDNSname" apt-get install gitlab-ce
else
echo ""
fi


if [[ $inputOne = 5 ]]
then

mkdir -p /home/$USER/Downloads > /dev/null 2>&1

apt install unzip -y > /dev/null 2>&1

cd /home/$USER/Downloads

unzip '*.zip'

rm *.zip > /dev/null 2>&1
fi

if [[ $inputOne = "" ]] || [[ $inputOne -ge 6 ]]
then
clear
echo "Get the fuck out of here!"
else
echo ""
fi