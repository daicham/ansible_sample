#!/usr/bin/env bash

# Add proxy setting to /etc/profile.d
cat <<EOF > /etc/profile.d/proxy.sh
export http_proxy=$1
export https_proxy=$2
EOF
echo "*** /etc/profile.d/proxy.sh was created."

# Add keep env for proxy to /etc/sudoers.d/keep_env_proxy
cat <<EOF > /etc/sudoers.d/keep_env_proxy
Defaults env_keep += "http_proxy https_proxy"
EOF
echo "*** /etc/sudoers.d/keep_env_proxy was created."

# Disable iptables
chkconfig iptables off
service iptables stop
