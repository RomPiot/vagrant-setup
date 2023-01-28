# -*- mode: ruby -*-
# vi: set ft=ruby :

# Documentations : https://docs.vagrantup.com.
Vagrant.configure("2") do |config|
  # Check here the linux version available : https://vagrantcloud.com/search
  # Linux version to setup
  config.vm.box = "generic/debian11"
  config.env.enable

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

  # WINDOWS_USERNAME = ENV['WINDOWS_USERNAME']
  config.vm.synced_folder "C:\\projects", "/home/vagrant/projects", type: "smb", smb_username: "#{ENV['WINDOWS_USERNAME']}", smb_password: "#{ENV['WINDOWS_PASSWORD']}"

  # sync debian_user_config folder to vagrant user home
  config.vm.synced_folder "./debian_user_config", "/home/vagrant", type: "smb", smb_username: "#{ENV['WINDOWS_USERNAME']}", smb_password: "#{ENV['WINDOWS_PASSWORD']}"

  # config.vm.synced_folder "C:\\Users\\#{ENV['WINDOWS_USERNAME']}\\.ssh", "/home/vagrant", type: "smb", smb_username: "#{ENV['WINDOWS_USERNAME']}", smb_password: "#{ENV['WINDOWS_PASSWORD']}"

  # config.vm.synced_folder "C:\\Users\\#{ENV['WINDOWS_USERNAME']}\\", "/home/vagrant", type: "rsync",
  #   rsync__args: ["-r", "--include=.gitconfig", "--include=.bash_aliases", "--exclude=*"],
  #   rsync__auto: true


  # Configure the VM
  config.vm.provider "hyperv" do |hv|
    hv.enable_virtualization_extensions = true
    hv.vmname = "setup-dev-linux"
    hv.vm_integration_services = {
      guest_service_interface: true,
      heartbeat: true,
      key_value_pair_exchange: true,
      shutdown: true,
      time_synchronization: true,
      vss: true
    }
    hv.linked_clone = true
    hv.cpus = 4
    hv.maxmemory = 4096
    hv.memory = 4096
  end

  # Provisioning script to install linux packages
  config.vm.provision "shell", path: "scripts/install.sh"
  config.vm.provision "shell", path: "scripts/aliases.sh"
end
