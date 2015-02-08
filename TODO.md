### Kickstart/preseed:
 Debian:
 - python-apt
 - python-selinux
 - wget

 RHEL/CentOS
 - libselinux-python

 Common:
 - ttyallocation disable for sudo
 - root password setup, ssh keys upload
 - xfs, one common partition, swap
 - define amount of ram and disk ?
 - locales
 - timezone

Pig host:
 - uploading initrd and vmlinuz using cobbler
   - fix proxy setup in dracut (see article below)
 - customrepo for local yum and apt packages, packages uploaded by ansible
 - remove repo handling from cobbler altogether. Just pass repo to "url" ks
   param, and do not setup any repos in cobbler itself. Will require adding 
   repo to basics though
 - cobbler centos provisioning
   - test hostname setup via cobbler webinterface
 - cobbler debian provisioning
 - recursive dns cache on localhost, plus forward zone to cobbler for cobbler
   zones
   - add dns templating (forward and rev) to cobbler
   - fix resolv.conf issues with network manager on mop
   - redirect all dns queries to localhost
 - optional:
    - local copies of git repositories on cobbler, accesible through SSH from
      other machines
    - koan
    - inventory tool
    - further automation of provisioning

### Playbook:
- <None>

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
