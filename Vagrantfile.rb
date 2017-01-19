
Vagrant.configure("2") do |config|

  config.vm.box = "hashicorp/precise64"
  vb.memory = "2048"


  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook.yml"
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
  end  

end
