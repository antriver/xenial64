#!/usr/bin/env bash

# Print commands
set -v

# Stop on errors
set -e

export DEBIAN_FRONTEND=noninteractive

whoami

sudo -i

whoami

# DEFAULT USER SETTINGS
# https://www.vagrantup.com/docs/boxes/base.html

# "vagrant" User. No longer needed as newer ubuntu/xenial64 already have the vagrant user.

#useradd vagrant -m -p paX5EmO4EXy0I
# Password: vagrant

mkdir -p /home/vagrant/.ssh

curl https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub > /home/vagrant/.ssh/authorized_keys

chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh
chmod 0600 /home/vagrant/.ssh/authorized_keys

# Root Password: "vagrant"

echo "root:vagrant" | chpasswd

###
# Password-less Sudo
###

echo "vagrant ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/vagrant

# SSH Tweaks
echo -e "\nUseDNS no" >> /etc/ssh/sshd_config
service ssh restart

# Install latest git
add-apt-repository -y ppa:git-core/ppa
apt-get update
apt-get upgrade -y
apt-get install -y git
git --version

# ADDITIONAL SOFTWARE
# https://www.vagrantup.com/docs/virtualbox/boxes.html


# VirtualBox Guest Additions

# Remove any existing virtualbox additions
#apt-get purge -y virtualbox*
#
#apt-get install -y build-essential linux-headers-$(uname -r)
#
#wget http://download.virtualbox.org/virtualbox/6.1.16/VBoxGuestAdditions_6.1.16.iso
#mkdir /media/VBoxGuestAdditions
#mount -o loop,ro VBoxGuestAdditions_6.1.16.iso /media/VBoxGuestAdditions
#sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run
#rm VBoxGuestAdditions_*.iso || true
#umount /media/VBoxGuestAdditions
#rmdir /media/VBoxGuestAdditions

# Remove ubuntu user
#deluser --remove-home ubuntu

# Install puppet
apt install -y puppet-common
puppet --version

apt-get clean

#dd if=/dev/zero of=/EMPTY bs=1M
#rm -f /EMPTY

cat /dev/null > ~/.bash_history && history -c && exit
