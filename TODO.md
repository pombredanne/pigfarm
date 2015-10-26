# While rewritting:
- removal of unused vim plugins/repos
- ssh tightening - extra secure ciphers
- removal of unneded vagrant plugins
- cleanup of sync-conflict- files

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
