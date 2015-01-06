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
 - cobbler
 - customrepo for local yum and apt packages, packages uploaded by ansible
 - caching proxy for packages instead of local copies of repos
 - local copies of git repositories on cobbler

### Playbook:
- review the running processes, check if there is something that can be removed/stopped

### Misc:
http://wiki.centos.org/EdHeron/EditorDefaultNano
http://www.linuxsysadmintutorials.com/build-and-install-vim-7-4-on-centos-6-using-rpm/

### custom repo on cobbler:
http://wiki.centos.org/HowTos/CreateLocalRepos
