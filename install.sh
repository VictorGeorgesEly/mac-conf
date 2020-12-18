#!/bin/bash

echo " ____       _   _   _                             __  __            "
echo "/ ___|  ___| |_| |_(_)_ __   __ _   _   _ _ __   |  \/  | __ _  ___ "
echo "\___ \ / _ \ __| __| | '_ \ / _\` | | | | | '_ \  | |\/| |/ _\` |/ __|"
echo " ___) |  __/ |_| |_| | | | | (_| | | |_| | |_) | | |  | | (_| | (__ "
echo "|____/ \___|\__|\__|_|_| |_|\__, |  \__,_| .__/  |_|  |_|\__,_|\___|"
echo "                            |___/        |_|                        "

sudo easy_install pip
sudo pip install ansible

installdir="/tmp/setupmac-$$"
mkdir $installdir

git clone https://github.com/picsous/mac-conf.git $installdir
if [ ! -d $installdir ]; then
    echo "git cloned failed"
    echo "exiting..."
    exit 1
else
    cd $installdir
    ansible-playbook -i ./hosts playbook.yml --verbose
fi

echo "cleaning up..."

rm -Rfv /tmp/$installdir

echo "and we are done! Enjoy!"

exit 0
