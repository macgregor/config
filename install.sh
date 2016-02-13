#! /bin/bash

cp_with_backup(){
    if [ -f $2 ]
    then
        mv $2 "$2_old"
    cp $1 $2
}

install_powerline(){
    pip install --user git+git://github.com/Lokaltog/powerline
    wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
    mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
    fc-cache -vf ~/.fonts
    mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
}

copy_user_configs(){
    cp_with_backup ./bashrc ~/.bashrc
    cp_with_backup ./vimrc ~/.vimrc
    cp_with_backup ./bash_profile ~/.bash_profile
}

OS=$(lsb_release -si)

if [ $OS == "Fedora" ]
then
    echo "do Fedora stuf"
elif [ $OS == "Ubuntu" ]
then
    sudo apt-get install yakuake python-pip python-dev build-essential git openjdk-6-jdk openjdk-7-jdk openjdk-8-jdk
    sudo pip install --upgrade pip
    sudo pip install --upgrade virtualenv
fi
install_powerline
copy_user_configs
