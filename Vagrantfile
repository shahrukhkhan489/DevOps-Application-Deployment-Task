Vagrant.configure("2") do |config|

	config.vm.box = "ubuntu/trusty64"


	config.vm.provider "virtualbox" do |vb|
		vb.memory = "2048"
	end

	config.vm.provision "ansible" do |ansible|
		ansible.playbook = "Complete-playbook.yaml"
	end

end