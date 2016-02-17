# config
Ansible project to initialize a local computer with programs and configuration files I typically use (e.g. .bashrc file, guake terminal, etc).

Ideally I can run this script on a new computer and feel right at home afterwards. The fedora_bootstrap uses dnf to get required packages to run ansible, different linux distros will require their own bootsraps.

Tested on:
Fedora 23

Implemented:
guake
powerline
git-passport
pip
generate ssh key
keepass
dropbox

Config:
.bashrc
.vimrc
.bash_profile
.gitattribute
.gitconfig
.gitpassport

TODO:
eclipse
java jdk
upload new ssh key to github
fix variable resolution with .gitconfig file

Probably cant automate:
dropbox initial setup
firefox addons
