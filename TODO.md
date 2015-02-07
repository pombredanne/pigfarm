### Kickstart/preseed:
 Debian:
 - python-apt
 - python-selinux

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
 - cobbler centos provisioning
    - disabling network boot after instalation
    - ssh keys
 - cobbler debian provisioning
 - optional:
    - local copies of git repositories on cobbler
    - customrepo for local yum and apt packages, packages uploaded by ansible
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
