#!/bin/bash

# Update & upgrade system
aptitude update
aptitude -y safe-upgrade

# Install required packages
aptitude -y install build-essential python-dev libmysqlclient-dev python-pip git

# Install 'iptables-persistent' package (optional)
export DEBIAN_FRONTEND=noninteractive
aptitude -q -y install iptables-persistent

# Install 'virtualenv' Python package
pip install virtualenv

# Create the Kippo virtualenv
virtualenv /opt/kippo

# Activate environment
. /opt/kippo/bin/activate

# Install Python requirements
pip install twisted pyasn1 pycrypto MySQL-python

# Clone Kippo repository
git clone https://github.com/desaster/kippo.git /opt/kippo/kippo
