# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "centos65"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"

  config.vm.define "control" do |control|
    control.vm.network "private_network", ip: "192.168.33.100"
    control.vm.provision :shell, :path => "provision.sh"
  end
  config.vm.define "dev" do |dev|
    dev.vm.network "private_network", ip: "192.168.33.101"
  end
end
