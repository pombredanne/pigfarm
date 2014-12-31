### Kickstart/preseed:
 Debian:
 - python-apt
 - python-selinux

 CentOS
 - libselinux-python

 Common:
 - sudo
 - ttyallocation disable for sudo
 - root password setup
 - ssh keys upload
 - xfs, one common partition, swap ?

### Playbook:
- firewall
- customrepo for local yum and apt packages ??
- caching proxy for packages instead of local copies of repos


### Misc:
http://wiki.centos.org/EdHeron/EditorDefaultNano
http://www.linuxsysadmintutorials.com/build-and-install-vim-7-4-on-centos-6-using-rpm/

### custom repo on cobbler:
http://wiki.centos.org/HowTos/CreateLocalRepos
