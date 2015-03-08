pigfarm
========

A collection of Ansible recipies/modules and python scripts used for creating small provisioning system.

This is quick and dirty and it may damage your workstation. USE AT YOUR OWN RISK!

provisioning a host
=======
peppa.tr -> create_*_vm.sh <name>.tr <ip>
peppa.tr -> cobbler sync
hypervisor -> sudo koan --virt --virt-path <vg_group> --server cobbler.tr --system <name>.tr

cobbler bootstrap
=======
peppa.tr -> cobbler_bootstrap.sh

on hypervisor remamber to add:
Host *.tr *.us
    User root

to /etc/ssh/ssh_config
