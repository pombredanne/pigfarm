config.ssh.username = 'vespian'
Vagrant.configure('2') do |config|
  config.ssh.username = 'vespian'
  config.ssh.insert_key = 'false'
  config.ssh.forward_agent = 'true'
  config.vm.provider :libvirt do |libvirt|
    # only qcow/file based storage is supported now, DM is not :(
    libvirt.storage_pool_name = "default"
  end
end
