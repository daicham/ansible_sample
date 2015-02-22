#!/usr/bin/env bash
# ===============================
# PROVISIONING SCRIPT For CentOS
# ===============================

# Install EPEL
yum install epel-release -y

# Disable EPEL Repository
mv /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.org
sed -e 's/enabled=1/enabled=0/' /etc/yum.repos.d/epel.repo.org > /etc/yum.repos.d/epel.repo

# Install Ansible
yum install ansible -y --enablerepo=epel
