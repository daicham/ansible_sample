#!/usr/bin/env bash
# =============================================
# Provisioning Script For Ansible on CentOS
# =============================================

# Copy SSH config for connecting target VM
mkdir -p /vagrant/.ssh
cp /vagrant/ssh_config /home/vagrant/.ssh/config
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/config

# Copy private key to connect dev via ssh
cp /vagrant/.vagrant/machines/dev/virtualbox/private_key /home/vagrant/.ssh/private_key_dev
chown vagrant:vagrant /home/vagrant/.ssh/private_key_dev
chmod 600 /home/vagrant/.ssh/private_key_dev

# Copy ansible playbook and so on
cp -r /vagrant/ansible /home/vagrant/
chown -R vagrant:vagrant /vagrant/ansible
chmod -x /vagrant/ansible/hosts

#
# Change yum repository url (see also: http://nin2.hatenablog.jp/entry/2013/08/19/205737)
#
cp -p /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.org
sed -e 's/^mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Base.repo.org|sed -e 's/^#baseurl/baseurl/g' > /etc/yum.repo.d/CentOS-Base.repo

#
# Update installed packages
#
yum update -y

#
# Install EPEL
#
yum install epel-release -y

# Disable EPEL Repository
cp -p /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.org
sed -e 's/enabled=1/enabled=0/' /etc/yum.repos.d/epel.repo.org > /etc/yum.repos.d/epel.repo

#
# Install Ansible
#
yum install ansible -y --enablerepo=epel

# Install libselinux-python (if target uses selinux)
yum install -y libselinux-python
