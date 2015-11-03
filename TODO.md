# While rewritting:
- ssh tightening - extra secure ciphers
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
