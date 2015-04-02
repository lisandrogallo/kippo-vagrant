# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # Ubuntu 14.04 LTS VM image
  config.vm.box = "ubuntu/trusty64"

  # Set VM name
  config.vm.provider :virtualbox do |vb|
    vb.name = "kippo-vagrant"
  end

  # Forward SSH and Kippo ports from guest to host
  config.vm.network :forwarded_port, guest: 22, host: 50022, id: "ssh"
  config.vm.network :forwarded_port, guest: 2222, host: 2222, id: "kippo"

  # Just in case, let's convert text file line endings from Windows to Unix formats
  config.vm.provision "shell", inline: "cp /vagrant/*.sh /tmp/"
  config.vm.provision "shell", inline: "aptitude -y install dos2unix && dos2unix /tmp/*.sh"

  # Run installation, configuration and execution scripts
  config.vm.provision "shell", inline: "cd /tmp/ && sh setupKippo.sh && sh configureKippo.sh && sh runKippo.sh"
  config.vm.provision "shell", inline: "cp /tmp/runKippo.sh /opt/kippo/ && rm /tmp/*.sh"

  # Run Kippo on startup
  config.vm.provision "shell", inline: "echo '@reboot vagrant /opt/kippo/runKippo.sh' >> /etc/cron.d/kippo"
  config.vm.provision "shell", inline: "chown vagrant: /opt/kippo/runKippo.sh"
  config.vm.provision "shell", inline: "chmod +x /opt/kippo/runKippo.sh"
end
