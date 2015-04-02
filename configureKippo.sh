#!/bin/bash

# Load iptables rules (optional)
cp /vagrant/rules.v4 /etc/iptables/rules.v4
sudo service iptables-persistent restart

# Change to Kippo repo directory
cd /opt/kippo/kippo/

# Create the configuration file
cp kippo.cfg.dist kippo.cfg

# Custom filesystem configuration
utils/createfs.py > fs.pickle

# Alternative root passwords
utils/passdb.py data/pass.db add password
utils/passdb.py data/pass.db add 12345
utils/passdb.py data/pass.db add 1234
utils/passdb.py data/pass.db add 123
utils/passdb.py data/pass.db add root
utils/passdb.py data/pass.db add qwerty
utils/passdb.py data/pass.db add admin

# Set permission to vagrant user
chown -R vagrant: /opt/kippo/kippo/
