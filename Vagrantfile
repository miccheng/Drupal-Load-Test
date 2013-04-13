Vagrant.configure("2") do |config|
	config.vm.box = "centos63"
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.3-x86_64-v20130101.box"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

	config.vm.define :lbal do |lbal|
  	lbal.vm.network :private_network, ip: "192.168.56.60"
  	lbal.vm.hostname = "drupaltest.local"
  	lbal.vm.provision :puppet do |puppet|
	    puppet.manifests_path = "manifests"
	    puppet.manifest_file  = "lbal_server.pp"
	    puppet.module_path = "modules"
	  end
  end

  config.vm.define :web1 do |web1|
  	web1.vm.network :private_network, ip: "192.168.56.61"
  	web1.vm.hostname = "drupal-web1.local"
  	web1.vm.synced_folder "./projects", "/projects", :nfs => true
  	web1.vm.provision :puppet do |puppet|
	    puppet.manifests_path = "manifests"
	    puppet.manifest_file  = "web_server.pp"
	    puppet.module_path = "modules"
	  end
  end
  config.vm.define :web2 do |web2|
  	web2.vm.network :private_network, ip: "192.168.56.62"
  	web2.vm.hostname = "drupal-web2.local"
  	web2.vm.synced_folder "./projects", "/projects", :nfs => true
  	web2.vm.provision :puppet do |puppet|
	    puppet.manifests_path = "manifests"
	    puppet.manifest_file  = "web_server.pp"
	    puppet.module_path = "modules"
	  end
  end
  
  config.vm.define :db do |db|
  	db.vm.network :private_network, ip: "192.168.56.63"
  	db.vm.hostname = "drupal-db.local"
  	db.vm.provision :puppet do |puppet|
	    puppet.manifests_path = "manifests"
	    puppet.manifest_file  = "db_server.pp"
	    puppet.module_path = "modules"
	  end
  end
end