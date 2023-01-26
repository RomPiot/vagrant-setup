# -*- mode: ruby -*-
# vi: set ft=ruby :

# Documentations : https://docs.vagrantup.com.
Vagrant.configure("2") do |config|

  # Check here the linux version available : https://vagrantcloud.com/search
  # Linux version to setup
  config.vm.box = "generic/debian11"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a specific private network IP for the VM
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Sync projects folder
  config.vm.synced_folder "C:\\projects", "/projects"

  # Configure the VM
  config.vm.provider "hyperv" do |hx|
    hx.enable_virtualization_extensions = true
    hx.vmname = "setup-dev-linux"
    hx.vm_integration_services = {
      guest_service_interface: true,
      heartbeat: true,
      key_value_pair_exchange: true,
      shutdown: true,
      time_synchronization: true,
      vss: true
    }
    hx.linked_clone = true
    hx.cpus = 4
    hx.maxmemory = 4096
    hx.memory = 4096
  end

  # Provisioning script to install linux packages
  config.vm.provision "shell", path: "install.sh"
end
