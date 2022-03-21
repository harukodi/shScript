#Description
#This is a test to see if a pcakage is already installed on the target system


if [[ $(command -v curl) ]] || [[ $optionPrompt = 1 ]]
then
echo "curl is installed"
else
#installation for curl
sudo apt update
#clear after apt update
clear
#ask for yes or no to continue installation of curl
echo "curl is not installed do you want to install it y or n?"
read askPrompt
sudo apt install curl -$askPrompt > /dev/null 2>&1
echo "curl is now installed"
elif [[ $askPrompt = "n" ]]
echo "curl installation cancled by user!"
fi