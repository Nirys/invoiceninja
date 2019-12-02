# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "scotch/box"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  #config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "private_network", ip: "192.168.55.73"
  config.vm.host_name = "local.ninja.com"

    # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # UNCOMMENT THIS AFTER VAGRANT IS PROVISIONED
  config.vm.synced_folder "./", "/var/www/", id: "vagrant-root" , :owner => "www-data", :group => "www-data", mount_options: ["dmode=775,fmode=775"]

  config.vm.provider "virtualbox" do |vb|
    #vb.memory = "2048s"
     vb.customize ["modifyvm", :id, "--memory", 2048]
  end

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.provision "shell", path: "vagrant-provision.sh"
end