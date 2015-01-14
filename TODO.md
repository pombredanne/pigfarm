### Kickstart/preseed:
 Debian:
 - python-apt
 - python-selinux

 CentOS
 - libselinux-python

 Common:
 - ttyallocation disable for sudo
 - root password setup, ssh keys upload
 - xfs, one common partition, swap
 - define amount of ram and disk ?
 - locales
 - timezone

Pig host:
 - adapt apache2_base to CentOS 7
 - cobbler role
 - customrepo for local yum and apt packages, packages uploaded by ansible
 - squid forward proxy for packages instead of local copies of repos
 - local copies of git repositories on cobbler

### Playbook:
- <None>

### Misc:
http://wiki.centos.org/EdHeron/EditorDefaultNano
http://www.linuxsysadmintutorials.com/build-and-install-vim-7-4-on-centos-6-using-rpm/

### custom repo on cobbler:
http://wiki.centos.org/HowTos/CreateLocalRepos
