#!/bin/bash

wget  https://releases.hashicorp.com/vagrant/1.9.1/vagrant_1.9.1_x86_64.rpm
rpm -ivh vagrant_1.9.1_x86_64.rpm
sudo yum install -y epel-release ansible


wget -O /etc/yum.repos.d/virtualbox.repo http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
yum -y update

yum remove -y kernel-devel
yum install -y kernel-devel

rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
yum install -y binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel kernel-PAE-devel dkms VirtualBox-5.1

/usr/lib/virtualbox/vboxdrv.sh setup

service vboxdrv setup
usermod -a -G vboxusers root

mkdir box; cd box;

cat > Vagrantfile << EOF
Vagrant.configure("2") do |config|

	config.vm.box = "hashicorp/precise64"


	config.vm.provider "virtualbox" do |vb|
		vb.memory = "2048"
	end

	config.vm.provision "ansible" do |ansible|
		ansible.playbook = "playbook.yml"
	end

end
EOF

vagrant up

