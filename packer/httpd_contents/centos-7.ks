#platform=x86, AMD64, or Intel EM64T
# Use text mode install
text

# System authorization information
auth --enableshadow --passalgo=sha512

# Disk:
clearpart --drives=vda --all --initlabel
bootloader --location=mbr --boot-drive=vda
part / --fstype="xfs" --ondisk=vda --grow
part swap --fstype="swap" --ondisk=vda --size=512

# Other:
firewall --enabled --ssh
firstboot --disable

# i18n
keyboard --vckeymap=pl2 --xlayouts='pl (legacy)'
lang en_GB.UTF-8

url --url=http://ftp.prz.edu.pl/centos/7/os/x86_64/
# Network information
network --bootproto=dhcp --device=eth0 --onboot=on  


# Root password
rootpw --iscrypted $1$WjMuRK.5$KYg8x3o3fznFQbahfg36g1

# yum repos:


# System timezone
timezone Europe/Warsaw --isUtc

# SELinux configuration
selinux --enforcing

# Install OS instead of upgrade
install

# Do not configure the X Window System
skipx

# Reboot after installation
reboot

%pre
set -x -v
exec 1>/tmp/ks-pre.log 2>&1

# Once root's homedir is there, copy over the log.
while : ; do
    sleep 10
    if [ -d /mnt/sysimage/root ]; then
        cp /tmp/ks-pre.log /mnt/sysimage/root/
        logger "Copied %pre section log to system"
        break
    fi
done &
%end

%packages
libselinux-python
wget
%end

%post --nochroot
set -x -v
exec 1>/mnt/sysimage/root/ks-post-nochroot.log 2>&1
%end

%post
set -x -v
exec 1>/root/ks-post.log 2>&1

# Start ssh-key configuration
mkdir -v /root/.ssh/
chmod -v 0700 /root/.ssh/
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJeKTa1hX4KMj2+7MzHPogWgQkDek0vmakhTUcfbvxRkWZ7Ab7NYzJ/M3q5UjzrW2JgGHYkBt8AgKkjhzGsuZD3E6fEmcGVtV8C93/Y3qStSJNk6QxFryadE6nmqTz7ywxKs2akkOyxbCQ+4YVe4q4xo+oqnqRlJRx4xzH/oG0bcPKzoqSYMXoiYBtJtv4C0O+VG6hMkdoH193Pa7hEwLJOLRIJxdjrSRDoxCjq4B4MBJty8UIWourR+WGdDoJBBas7qX0VPxlPv8OT5PZOdtsojMJgwtjc+Dt34aD1zV+n/xfg1LtqAFpeqRpOT6DbLm3/aghf30J7c7vPhAWbsNd vespian@budrys' > /root/.ssh/authorized_keys
chmod 0600 /root/.ssh/authorized_keys
restorecon -Rv /root/.ssh/
# End ssh-key configuration

# Start sudo tty allocation fix
sed -i '/Defaults.*requiretty/d' /etc/sudoers
# End sudo tty allocation fix

# Do postinstall system configuration
sed -i -e 's/PermitRootLogin \S*/PermitRootLogin yes/g' /etc/ssh/sshd_config
%end
