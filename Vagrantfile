# -*- mode: ruby -*-
# vi: set filetype=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "cmiles/gentoo-amd64-minimal"
  config.vm.hostname = "gentoo.box"
  config.vm.provision "shell", privileged: false, path: "bootstrap.sh"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "~/Workspace", "/home/vagrant/Workspace"

  config.vm.provider :virtualbox do |vbox|
    vbox.cpus = "1"
    vbox.memory = "1024"
    vbox.name = "Gentoo 64-bit"
  end

end
