#! /bin/bash
echo "Installing required packages"
echo "========== Starting Setup ==========" >> ./setup.log
echo "$(date)" >> ./setup.log

sudo dnf install -y python-setuptools git python-devel python-dnf libxml2-devel libxslt-devel redhat-rpm-config libselinux-python &>> ./setup.log

echo "Installing pip"
sudo easy_install pip &>> ./setup.log

echo "Installing Ansible"
sudo pip install -r requirements.txt &>> ./setup.log

ansible-playbook setup.yaml -i HOSTS --ask-sudo-pass  --module-path ./ansible_modules --extra-vars "@config.json" 2>&1 | tee -a ./setup.log

echo "========== Finished Setup ==========" >> ./setup.log
echo "Set up complete, see ./setup.log for details"
