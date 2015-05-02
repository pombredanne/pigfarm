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

manual update of cobbler signatures
=======
wget https://raw.githubusercontent.com/cobbler/cobbler/59a24f2cc2a7db908f6beac7bdd34e783d718cdc/config/cobbler/distro_signatures.json \
    -O  /var/lib/cobbler/distro_signatures.json

manual update of libosinfo signatures
=======
sudo wget https://git.fedorahosted.org/cgit/libosinfo.git/plain/data/oses/ubuntu.xml.in\?id\=dafbab7cf5e1d9a8f9cde7f56e58f83e0820799e -O  /usr/share/libosinfo/db/oses/ubuntu.xml
