Kippo-Vagrant
===============

Kippo-Vagrant provides a Vagrant configuration file (Vagrantfile) and shell scripts to automate the setup of a Kippo malware honeypot virtual machine (based on Ubuntu 14.04 LTS)

Based on Dionaea-Vagrant configuration available at https://github.com/ikoniaris/dionaea-vagrant


# Installation

    git clone https://github.com/ikoniaris/dionaea-vagrant && cd dionaea-vagrant
    vagrant up

This will create a new Ubuntu 14.04 LTS VM on the fly (named 'kippo-vagrant') and start it, install Kippo with its dependencies and execute it as daemon.

# Port forwarding

In your Internet-facing router forward incomming SSH connections (port 22/TCP) to port 2222/TCP on your host machine (our PC), which will automatically forward traffic to Kippo port on guest (the honeypot VM).

# Useful Vagrant commands

Inside the kippo-vagrant directory you can run any Vagrant command.

To login into the guest machine (for example, to see Kippo's log): `vagrant ssh`

To stop the guest machine:``vagrant halt`

To start the honeypot VM: `vagrant up`
