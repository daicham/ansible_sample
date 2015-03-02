#!/usr/bin/env bash
# =============================================
# Provisioning Script For Ansible on CentOS
#   arg1: VM Name (config.vm.define="VM NAME")
# =============================================

#
# Install EPEL
#
yum install epel-release -y

# Disable EPEL Repository
cp -p /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.org
sed -e 's/enabled=1/enabled=0/' /etc/yum.repos.d/epel.repo.org > /etc/yum.repos.d/epel.repo

#
# Update installed packages
#
yum update -y

#
# Install Ansible
#
yum install ansible -y --enablerepo=epel

# Copy SSH config for connecting target VM
mkdir -p /vagrant/.ssh
cp /vagrant/ssh_config /home/vagrant/.ssh/config

# Copy ansible playbook and so on
cp -r /vagrant/ansible /home/vagrant/
