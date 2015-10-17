# While rewritting:
- include contents of "grzebanie" file
- standarize sftp uid
- removal of ssh keys ?
- removal of unused vim plugins/repos
- inexistant hosts should get default values for variuos hostname-related
  params
- ssh tightening - extra secure ciphers
- removal of unneded vagrant plugins

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
