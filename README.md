# config
Ansible project to initialize a local computer with programs and configuration files I typically use (e.g. .bashrc file, guake terminal, etc).


Ideally I can run this script on a new computer and feel right at home afterwards. The fedora_bootstrap uses dnf to get required packages to run ansible, different linux distros will require their own bootsraps.


#Roles
* Common
  * common software installation/setup goes here
  * should not be included directly
* Beastop
  * specific machine setup goes here (e.g. my work laptop doesnt need bumblebee so it goes here instead of common)
  * declares a machines variables which are passed to common when installing software (e.g. username, github user, etc)
* Dotfiles
  * dotfile and other configurations you want to manage seperate from a programs installation
  * after initial setup you probably dont want to spend time reinstalling (even if most of the reinstall steps are noops)


#Variables
See HOSTS file for defaults. Any variables can be overriden with -e when calling ansible. Any parameters passed to the bootstrap script will pass them on to ansible when it is called


##Top Level Variables
* debug
  * whether to enable debug output
* install
  * whether to inclue a machine spcific role (e.g. beastop)
* install_full
  * whether to include common software


##Machine Role Variables
TODO


##Common Role Variables
TODO


#Tested on
* Fedora 23


#Software installed
* guake
* powerline
* git-passport
* pip
* generate ssh key
* keepass
* bumblebee
* flash


#Dotfiles
* .bashrc
* .vimrc
* .bash_profile
* .gitattribute
* .gitconfig
* .gitpassport


#TODO
* eclipse
* java jdk
* upload new ssh key to github
* firefox intiail set up (import from FEBE if possible)
