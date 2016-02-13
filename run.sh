#! /bin/bash
sudo dnf install -y python-setuptools git python-devel python-dnf libxml2-devel libxslt-devel redhat-rpm-config
sudo easy_install pip
sudo pip install -r requirements.txt

ansible-playbook -vvv setup.yaml -i HOSTS --ask-sudo-pass  --module-path ./ansible_modules --extra-vars "@config.json"
