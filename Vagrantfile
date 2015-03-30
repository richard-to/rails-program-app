# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "chef/ubuntu-14.04"

  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.provider "vmware_fusion" do |vf|
    vf.vmx["memsize"] = "1024"
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "playbook.yml"
  end

end
