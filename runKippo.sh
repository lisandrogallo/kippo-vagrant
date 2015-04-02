#!/bin/bash

# Start Kippo in background
cd /opt/kippo/kippo/
sudo -u vagrant /opt/kippo/bin/twistd -y kippo.tac -l log/kippo.log --pidfile kippo.pid
