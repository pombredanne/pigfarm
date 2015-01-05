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
 - define amount of ram and disk ?

### Playbook:
- locales
- timezone
- password root setup
- customrepo for local yum and apt packages, packages uploaded by ansible
- caching proxy for packages instead of local copies of repos
- local copies of git repositories on cobbler

### Misc:
http://wiki.centos.org/EdHeron/EditorDefaultNano
http://www.linuxsysadmintutorials.com/build-and-install-vim-7-4-on-centos-6-using-rpm/

### custom repo on cobbler:
http://wiki.centos.org/HowTos/CreateLocalRepos
