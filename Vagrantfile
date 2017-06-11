# -*- mode: ruby -*-
# vi: set ft=ruby :
disk1 = 'Disk/disk1.vdi'
disk2 = 'Disk/disk2.vdi'
Vagrant.configure(2) do |config|
 config.vm.define "proxy" do |proxy|
   proxy.vm.box = "ubuntu/trusty64"
   proxy.vm.hostname = "proxy"
   proxy.vm.network "private_network", ip: "192.168.80.9"
   proxy.vm.network :"public_network"
   proxy.vm.provision :ansible do |ansible|
    ansible.playbook = "tasks/nginx/main.yml"
  end
  proxy.vm.provider :virtualbox do |v|
     v.customize ["modifyvm", :id, "--memory", 1024]
     v.customize ["modifyvm", :id, "--name", "proxyWEB"]
   end
 end

    config.vm.define "Nc1" do |config|
        config.vm.box = "ubuntu/trusty64"
        config.vm.hostname = "Nc1"
        config.vm.network "private_network", ip: "192.168.80.10"
        config.vm.provision :ansible do |ansible|
          ansible.verbose = "-v"
         ansible.playbook = "tasks/keepalived/main.yml"

         end
       config.vm.provider :virtualbox do |v|
         unless File.exist?(disk1)
           v.customize ['createhd', '--filename', disk1, '--size', 50 * 1024]
         end
           v.customize ['storageattach', :id, '--storagectl', 'SATAController', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', disk1]
           v.customize ["modifyvm", :id, "--memory", 1024]
           v.customize ["modifyvm", :id, "--name", "Nc1"]
         end
       end

       config.vm.define "Nc2" do |config|
           config.vm.box = "ubuntu/trusty64"
           config.vm.hostname = "Nc2"
           config.vm.network "private_network", ip: "192.168.80.11"
           config.vm.provision :ansible do |ansible|
             ansible.verbose = "-v"
             ansible.playbook = "tasks/keepalived/main.yml"

            end
          config.vm.provider :virtualbox do |v|
            unless File.exist?(disk2)
              v.customize ['createhd', '--filename', disk2, '--size', 50 * 1024]
            end
             v.customize ['storageattach', :id, '--storagectl', 'SATAController', '--port', 1, '--device', 0, '--type', 'hdd', '--medium',disk2]
             v.customize ["modifyvm", :id, "--memory", 1024]
             v.customize ["modifyvm", :id, "--name", "Nc2"]
           end
         end
     config.vm.define "HAProxy" do |config|
          config.vm.box = "ubuntu/trusty64"
          config.vm.hostname = "HAProxy"
          config.vm.network "private_network", ip: "192.168.80.14"
          config.vm.provision :ansible do |ansible|
           ansible.playbook = "tasks/HAproxy/main.yml"
           end
         config.vm.provider :virtualbox do |v|
            v.customize ["modifyvm", :id, "--memory", 1024]
            v.customize ["modifyvm", :id, "--name", "HAProxy"]
          end
        end

      config.vm.define "Mysql1" do |db|
      db.vm.box = "ubuntu/trusty64"
      db.vm.hostname = "Mysql1"
      db.vm.network "private_network", ip: "192.168.80.15"
      db.vm.provision :ansible do |ansible|
        ansible.verbose = "-v"
       ansible.playbook = "tasks/mysql/main.yml"
       end
      db.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--name", "Mysql1"]
      end
    end

    config.vm.define "Mysql2" do |db|
      db.vm.box = "ubuntu/trusty64"
      db.vm.hostname = "Mysql2"
      db.vm.network "private_network", ip: "192.168.80.16"
      db.vm.provision :ansible do |ansible|
        ansible.verbose = "-v"
       ansible.playbook = "tasks/mysql/main.yml"
       end
      db.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--name", "Mysql2"]
      end
    end
end
