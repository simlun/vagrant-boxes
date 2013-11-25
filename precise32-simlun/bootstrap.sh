#!/bin/bash

TIMEZONE=Europe/Stockholm
UBUNTU_MIRROR=se

# Set timezone
echo $TIMEZONE | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata

# Set Ubuntu mirror
sudo sed -i "s/us\.archive/$UBUNTU_MIRROR\.archive/g" /etc/apt/sources.list
sudo apt-get update

# Upgrade the system, in non-interactive mode so grub-pc does not ask stupid
# questions after upgrade <https://github.com/mitchellh/vagrant/issues/289>.
DEBIAN_FRONTEND=noninteractive \
    apt-get -qy \
    -o Dpkg::Options::="--force-confdef" \
    -o Dpkg::Options::="--force-confold" \
    dist-upgrade

sudo apt-get clean
sudo rm -rfv /tmp/VBoxGuestAdditions.iso

