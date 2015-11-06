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

patching koan in order to fix generic26 bug:
=======
--- /usr/lib/python2.7/site-packages/koan/virtinstall.py	2015-03-07 11:24:03.000000000 +0100
+++ /usr/lib/python2.7/site-packages/koan/virtinstall.py.new	2015-11-06 23:56:01.941153750 +0100
@@ -378,6 +378,10 @@ def build_commandline(uri,
             found = False
             if os_version in supported_variants:
                 pass # os_version is correct
+            elif os_version == 'ubuntutrusty':
+                os_version = 'ubuntu14.04'
+            elif os_version == 'debian8':
+                os_version = 'debian7'
             elif os_version + ".0" in supported_variants:
                 # osinfo based virt-install only knows about major.minor
                 # variants, not just major variants like it used to. Default

notes
=======
### Playbook:
- <None>

# System specific data:
- add proxy=http://172.17.0.2:3128/ to the kernel line options
- repo attachement is needed because otherwise mirrorselect uses different repo
    than the proxy allows
- hostname of the host
- dns-name
- name set to inventory hostname
- inventory_name must end either in 'tr' or 'us'
- ansible_ssh_host added to distro profile after dynamic inventory update,
  remove Host definition from ssh_config
- mimimum 1G of memory for Centos7, Centos6 is OK with 768 (512?) MB.
- koan command:
  sudo koan --virt --virt-path=vg-ssd --server=cobbler.tr    --system=c7t.tr
- pxe boot must be enabled for koan

### Misc:
http://wiki.centos.org/EdHeron/EditorDefaultNano
http://www.linuxsysadmintutorials.com/build-and-install-vim-7-4-on-centos-6-using-rpm/

### custom repo on cobbler:
http://wiki.centos.org/HowTos/CreateLocalRepos

### not expanding tree var in kickstart:
https://lists.fedorahosted.org/pipermail/cobbler/2009-March/003316.html

## Ansible role for setting proxy:
https://github.com/ruzickap/ansible-role-proxy_settings

## Own yum repo:
http://www.techrepublic.com/blog/linux-and-open-source/create-your-own-yum-repository/

## Problems with not using proxy for centos initrd:
http://hasis053341.blogspot.com/2014/07/install-centos-7-with-kickstart-over.html

## Problem with non-cacheable object (order IS important!)
http://squid-web-proxy-cache.1019090.n4.nabble.com/RE-Strange-misses-of-cacheable-objects-SOLVED-td4665658.html

## Debian pre-seeding:
http://hempeldesigngroup.com/embedded/stories/preseeding-a-debian-squeeze-netboot-install/
https://dmytro.github.io/2012/06/21/debian_cobbler.html
https://fedorahosted.org/cobbler/wiki/DebianDeployment
http://www.colinmcnamara.com/setting-up-cobbler-pxe-auto-deployment-for-ubuntu-server-12-04-precise/
http://kaivanov.blogspot.com/2014/02/injecting-kernel-modules-in-initrdgz.html
https://www.soljerome.com/blog/2011/10/23/preseeding-debian-wheezy/

wget http://cdimage.debian.org/debian-cd/7.8.0/amd64/iso-cd/debian-7.8.0-amd64-netinst.iso
mnt na loop
cobbler signatures update
cobbler import --breed debian --os-version wheezy --name debian-7-x86_64 --arch x86_64 --path 
edit .treeinfo
in case of custom build: tree=http://@@http_server@@/cblr/links/debian-7-x86_64
http://arian-it.blogspot.com/2014/04/cobbler-i-automatyczna-instalacja.html
https://cptyesterday.wordpress.com/2012/06/17/notes-on-using-expert_recipe-in-debianubuntu-preseed-files/
https://lists.fedorahosted.org/pipermail/cobbler-devel/2012-August/002707.html


debian network repos are no good for netinstall, netboot is necessary ?

Additional options that may be of interest while attempting to automate an install while using DHCP are: interface=auto netcfg/dhcp_timeout=60 which makes the machine choose the first viable NIC and be more patient about getting a reply to its DHCP query. 

Partman:
http://code.metager.de/source/xref/debian/installer/doc/devel/partman-auto-recipe.txt
http://secopsmonkey.com/custom-partioning-using-preseed.html (formula for priority)

Debugging preseed:
add "preseed/interactive=true" to the commandline
