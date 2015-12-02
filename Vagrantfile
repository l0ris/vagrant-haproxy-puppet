# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puppetlabs/centos-6.6-64-nocm"
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 256]
  end

  config.vm.define :haproxy, primary: true do |haproxy_config|

    haproxy_config.vm.hostname = 'haproxy'
    haproxy_config.vm.network :forwarded_port, guest: 8080, host: 8080
    haproxy_config.vm.network :forwarded_port, guest: 80, host: 8081

    haproxy_config.vm.network :private_network, ip: "192.168.11.10"
    haproxy_config.vm.provision :shell, :path => "haproxy-setup.sh"

  end
  config.vm.define :web1 do |web1_config|

    web1_config.vm.hostname = 'web1'
    web1_config.vm.network :private_network, ip: "192.168.11.20"
    web1_config.vm.provision :shell, :path => "web-setup.sh"


  end
  config.vm.define :web2 do |web2_config|

    web2_config.vm.hostname = 'web2'
    web2_config.vm.network :private_network, ip: "192.168.11.30"
    web2_config.vm.provision :shell, :path => "web-setup.sh"

  end
end
