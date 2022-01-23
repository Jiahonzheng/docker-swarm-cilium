Vagrant.configure("2") do |config|
  vms = Array(0..1)
  vms.each do |i|
    config.vm.define "NODE-#{i}" do |node|
      node.vm.box = "ubuntu/focal64"
      node.vm.hostname = "NODE-#{i}"
      node.vm.network "private_network", ip: "192.168.56.20#{i}"

      node.vm.provider "virtualbox" do |v|
        v.name = "NODE-#{i}"
        v.memory = 1024
        v.cpus = 1
      end
    end
  end
end
