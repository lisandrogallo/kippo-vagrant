Kippo-Vagrant
===============

**Kippo-Vagrant** provides a Vagrant configuration file (Vagrantfile) and shell scripts to automate the setup of a Kippo malware honeypot virtual machine (based on **Ubuntu 14.04 LTS**)

_Based on Dionaea-Vagrant configuration available at https://github.com/ikoniaris/dionaea-vagrant_

## Installation

`git clone https://github.com/ikoniaris/dionaea-vagrant && cd dionaea-vagrant`

`vagrant up`

This will create a new Virtualbox VM on the fly (named **kippo-vagrant**) and start it, install Kippo with its dependencies and execute it as daemon.

## Port forwarding

In your Internet-facing router forward incomming SSH connections (port 22/TCP) to port 2222/TCP on your host machine (our PC), which will automatically forward traffic to Kippo port on guest (the honeypot VM).

## Firewall

Optionally, the script files included commands for installing and configuring **iptables-persistent** package in order to easily load iptables rules to filter incomming connections.

It could be useful to configure default INPUT chain policy to **DROP** and accept connections only from specific sources based in geolocation. Using the service at **IP2Location** (http://www.ip2location.com/blockvisitorsbycountry.aspx) you can select a country and export the IPv4/IPv6 rules to use with iptables.

On this repo I included a **/etc/iptables/rules.v4** file containing Argentina's IP address ranges to be used with the **iptables-persistent** package previously installed.

## Useful Vagrant commands

Inside the kippo-vagrant directory you can run any Vagrant command:

`vagrant ssh` (login into the guest machine)

`vagrant halt` (stop the guest machine)

`vagrant up` (start the honeypot VM)
