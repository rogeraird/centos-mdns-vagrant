# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "public_network"
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/ssh_key.pub"
  config.vm.provision :shell, path: "bootstrap.sh"
end
