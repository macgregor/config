# config
Ansible project to initialize a local computer with programs and configuration files I typically use (e.g. .bashrc file, guake terminal, etc).


Ideally I can run this script on a new computer and feel right at home afterwards. The fedora_bootstrap uses dnf to get required packages to run ansible, different linux distros will require their own bootsraps.


#Software installed
* common
  * chrome
  * dropbox + encfs
  * flash
  * guake
  * keepass
  * powerline
  * spotify
* dev-common
  * cli_tools
  * docker
  * eclipse
  * gitpassport
  * git
  * gradle
  * java 8
  * pip, virtual env
  * python3 + pip3
  * vagrant
  * virtualbox
* beastop 
  * bumblebee
  * chromium-touchpad-drivers
  * steam
* lenovo
  * nothing special


#Dotfiles
* .bashrc
* .vimrc
* .bash_profile
* .gitattribute
* .gitconfig
* .gitpassport


#Tested on
* Fedora 23


#Roles
* common
  * common software installation/setup goes here
  * should not be included directly
* dev-common
  * common development tools installation/setup goes here
  * should not be incluced directly 
* beastop
  * personal laptop
  * included dynamically based on hostname
  * specific machine setup goes here (e.g. my work laptop doesnt need bumblebee so it goes here instead of common)
  * declares a machines variables which are passed to common when installing software (e.g. username, github user, etc)
* lenovo
  * work laptop
  * included dynamically based on hostname
* dotfiles
  * dotfile and other configurations you want to manage seperate from a programs installation
  * always installed first, before software
  * copied as templates, so you can put {{variables}} in dotfiles
  * try to keep contents in the actual dot file rather than building with lininfile or blockinfile as much as possible


#Variables
See HOSTS file and */defaults/main.yaml for defaults. Any variables can be overriden with -e when calling ansible. Any parameters passed to the bootstrap script will pass them on to ansible when it is called.
All software installation are gated behind install flags. Common and dev-common roles default most of these to false and leave it up to the machine role to override the software it wants to install.


##Top Level Variables
* debug
  * whether to enable debug output


##Machine Role Variables
TODO


##Common Role Variables
TODO


##Dev-common Role Variables
TODO
