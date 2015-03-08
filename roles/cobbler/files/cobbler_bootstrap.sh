#!/bin/sh
cobbler distro add  --name CentOS-6-x86_64 \
                    --owners admin \
                    --kernel /var/lib/cobbler/pxe/CentOS-6-x86_64/vmlinuz \
                    --initrd /var/lib/cobbler/pxe/CentOS-6-x86_64/initrd.img \
                    --kopts 'proxy=http://172.17.0.2:3128' \
                    --arch x86_64 \
                    --breed redhat \
                    --os-version rhel6
cobbler distro add  --name CentOS-7-x86_64 \
                    --owners admin \
                    --kernel /var/lib/cobbler/pxe/CentOS-7-x86_64/vmlinuz \
                    --initrd /var/lib/cobbler/pxe/CentOS-7-x86_64/initrd.img \
                    --kopts 'proxy=http://172.17.0.2:3128' \
                    --arch x86_64 \
                    --breed redhat \
                    --os-version rhel7
cobbler distro add  --name Debian-7-x86_64 \
                    --owners admin \
                    --kernel /var/lib/cobbler/pxe/Debian-7-x86_64/linux \
                    --initrd /var/lib/cobbler/pxe/Debian-7-x86_64/initrd.gz \
                    --kopts 'proxy=http://172.17.0.2:3128' \
                    --arch x86_64 \
                    --breed debian \
                    --os-version wheezy

cobbler repo add    --name Debian-7-x86_64 \
                    --owners admin \
                    --arch x86_64 \
                    --breed apt \
                    --mirror http://ftp.agh.edu.pl/debian \
                    --keep-updated 0 \
                    --mirror-locally 0 \
                    --apt-components 'main universe' \
                    --apt-dists wheezy wheezy-updates wheezy-security

cobbler profile add --name Centos6 \
                    --owners admin \
                    --distro CentOS-6-x86_64 \
                    --kickstart /var/lib/cobbler/kickstarts/red-hat.ks \
                    --proxy http://172.17.0.2:3128 \
                    --virt-cpus 2 \
                    --virt-file-size 6 \
                    --virt-disk-driver raw \
                    --virt-ram 768 \
                    --virt-type qemu \
                    --virt-bridge br_tr
cobbler profile add --name Centos7 \
                    --owners admin \
                    --distro CentOS-7-x86_64 \
                    --kickstart /var/lib/cobbler/kickstarts/red-hat.ks \
                    --proxy http://172.17.0.2:3128 \
                    --virt-cpus 2 \
                    --virt-file-size 7 \
                    --virt-disk-driver raw \
                    --virt-ram 1024 \
                    --virt-type qemu \
                    --virt-bridge br_tr
cobbler profile add --name Debian7 \
                    --owners admin \
                    --distro Debian-7-x86_64 \
                    --kickstart /var/lib/cobbler/kickstarts/debian.preseed.cfg \
                    --proxy http://172.17.0.2:3128 \
                    --kopts keymap=pl \
                    --ksmeta "tree=http://@@http_server@@/cblr/links/Debian-7-x86_64" \
                    --virt-cpus 2 \
                    --virt-file-size 6 \
                    --virt-disk-driver raw \
                    --virt-ram 768 \
                    --virt-type qemu \
                    --virt-bridge br_tr \
                    --repos Debian-7-x86_64
