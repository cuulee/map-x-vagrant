# -*- mode: ruby -*-
# vi: set ft=ruby :

VNAME = "map-x-full"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "fgrehm/trusty64-lxc"

  # change default name
  config.vm.define VNAME

  # machine node/hostname
  config.vm.hostname = VNAME

  # name and basic config of the VM
  config.vm.provider :lxc do |lxc|
    #lxc.customize 'cgroup.memory.limit_in_bytes', '1024M'
  end

  # provision : shell script
  config.vm.provision "shell", path: "scripts/install.sh"

  # Forward the PostgreSQL port:
  config.vm.network "forwarded_port", guest: 5432, host: 5432

  # Forward the geoserver port:
  config.vm.network "forwarded_port", guest: 80, host: 8888

end
