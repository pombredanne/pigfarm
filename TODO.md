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
 - cobbler WWW interface
 - cobbler centos provisioning
 - cobbler debian provisioning
 - squid forward proxy for packages instead of local copies of repos
 - local copies of git repositories on cobbler
 - customrepo for local yum and apt packages, packages uploaded by ansible
 - optional:
    - inventory tool
    - further automation of provisioning


### Playbook:
- <None>

### Misc:
http://wiki.centos.org/EdHeron/EditorDefaultNano
http://www.linuxsysadmintutorials.com/build-and-install-vim-7-4-on-centos-6-using-rpm/

### custom repo on cobbler:
http://wiki.centos.org/HowTos/CreateLocalRepos
