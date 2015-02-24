### Kickstart/preseed:
 Debian:
 - python-apt
 - python-selinux
 - wget

 Common:
 - ttyallocation disable for sudo
 - root password setup, ssh keys upload
 - xfs, one common partition, swap
 - define amount of ram and disk ?
 - locales
 - timezone

Pig host:
 - recursive dns cache on localhost, plus forward zone to cobbler for cobbler
   zones
   - fix resolv.conf issues with network manager on mop
 - cobbler provisioning
   - test debian provisioning

### Playbook:
- <None>

# System specific data:
- add proxy=http://172.17.0.2:3128/ to the kernel line options
- repo attachement is needed because otherwise mirrorselect uses different repo
    than the proxy allows
- hostname of the host
- dns-name
- name set to inventory hostname
- inventory_name must end either in 'tr' or 'us'
- ansible_ssh_host added to distro profile after dynamic inventory update,
  remove Host definition from ssh_config
- mimimum 1G of memory for Centos7, Centos6 is OK with 768 (512?) MB.
- koan command:
  sudo koan --virt --virt-path=vg-ssd --server=cobbler.tr    --system=c7t.tr
- pxe boot must be enabled for koan

### Misc:
http://wiki.centos.org/EdHeron/EditorDefaultNano
http://www.linuxsysadmintutorials.com/build-and-install-vim-7-4-on-centos-6-using-rpm/

### custom repo on cobbler:
http://wiki.centos.org/HowTos/CreateLocalRepos

### not expanding tree var in kickstart:
https://lists.fedorahosted.org/pipermail/cobbler/2009-March/003316.html

## Ansible role for setting proxy:
https://github.com/ruzickap/ansible-role-proxy_settings

## Own yum repo:
http://www.techrepublic.com/blog/linux-and-open-source/create-your-own-yum-repository/

## Problems with not using proxy for centos initrd:
http://hasis053341.blogspot.com/2014/07/install-centos-7-with-kickstart-over.html

## Problem with non-cacheable object (order IS important!)
http://squid-web-proxy-cache.1019090.n4.nabble.com/RE-Strange-misses-of-cacheable-objects-SOLVED-td4665658.html
