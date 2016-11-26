#!/usr/bin/env bash

# Print commands
set -v

# Stop on errors
set -e

vagrant destroy -f
vagrant up

# Provision script does everything on the machine. So now we're done. Just turn it off

vagrant halt

# Remove the private key file otherwise it will get baked into the box.
# This was added when first running vagrant ssh, but the private key for that was added to the ubuntu user which
# is now removed.
rm -f .vagrant/maachines/default/virtualbox/private_key

rm -f antriver-xenial64.box
vagrant package --output antriver-xenial64.box

# vagrant box add antriver/xenial64 ./antriver-xenial64.box
