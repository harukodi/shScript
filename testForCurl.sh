clear

echo "Options
Check your ip: 1"

read optionPrompt

if [[ $optionPrompt = 1 ]]
then
if [[ $(command -v curl) ]] && [[ $optionPrompt = 1 ]]
    then
    clear
    echo "here is your ip > $(curl -s ifconfig.me)"
    echo "here is your internal ip addresses > $(hostname -I)"
    else
    echo "curl is not installed"
    sleep 2
    echo "want to install [Y/n]"
    read askForInstallation
    if [[ $askForInstallation = y ]]
    then
    echo "Installing ..."
    fi
    sudo apt update > /dev/null 2>&1
    sudo apt install curl -$askForInstallation > /dev/null 2>&1
    if [[ $(command -v curl) ]]
    then echo "done"
    sleep 1
    clear
    echo "here is your ip> $(curl -s ifconfig.me)"
    echo "here is your internal ip addresses > $(hostname -I)"
    fi
    if [[ $askForInstallation = n ]]
    then echo "Installation stopped by user!"
    fi
fi
fi