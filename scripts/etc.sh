#!/bin/bash

# Hacky fix for Ubuntu 17.10 DNS issues
# See https://bugs.launchpad.net/ubuntu/+source/resolvconf/+bug/1725840
if [[ /etc/resolv.conf -ef /run/NetworkManager/resolv.conf ]]; then
  rm /etc/resolv.conf
  ln -sfn /run/resolvonf/resolv.conf /etc/resolv.conf
fi
