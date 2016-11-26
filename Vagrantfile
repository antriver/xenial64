# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/xenial64"

    config.vm.provision "shell", path: "./provision.sh"

	#config.ssh.username = "vagrant"
	#config.ssh.password = "vagrant"
	config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
      v.gui = true
    end

end
