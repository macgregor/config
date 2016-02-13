#! /bin/bash
sudo yun install -y python-setuptools git python-dev libxml2-dev libxslt-dev
sudo easy_install pip
sudo pip install -r requirements.txt

ansible-playbook setup.yml -i HOSTS --ask-sudo-pass  --module-path ./ansible_modules --extra-vars "@config.json"
