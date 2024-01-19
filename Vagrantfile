Vagrant.configure("2") do |config|
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "debian/bullseye64"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "256" # RAM
    vb.linked_clone = true
  end
 
  config.vm.define "mirror" do |debian|
    debian.vm.hostname = "mirror"
    debian.vm.network :private_network, ip: "192.168.57.20"
    debian.vm.provision "shell", path: "mirror.sh"
  end

  config.vm.define "ftp" do |debian|
    debian.vm.hostname = "ftp"
    debian.vm.network :private_network, ip: "192.168.57.30"
    debian.vm.provision "shell", path: "ftp.sh"
  end

  config.vm.define "ns" do |debian|
    debian.vm.hostname = "ns"
    debian.vm.network :private_network, ip: "192.168.57.10"
    debian.vm.provision "shell", path: "ns.sh"
  end
end
