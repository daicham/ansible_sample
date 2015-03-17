# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "centos65-x86_64"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"

  if RUBY_PLATFORM.match(/i386/) then
    config.vm.box = "centos65-i386"
    config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5-i386_chef-provisionerless.box"
  end

  config.vm.provision :shell, :path => "provision_proxy.sh", :args => [ENV["http_proxy"], ENV["https_proxy"]] if ENV["http_proxy"] != nil

  config.vm.define "control" do |control|
    control.vm.network "private_network", ip: "192.168.33.100"
    control.vm.provision :shell, :path => "provision.sh"
  end
  config.vm.define "dev" do |dev|
    dev.vm.network "private_network", ip: "192.168.33.101"
  end
end
