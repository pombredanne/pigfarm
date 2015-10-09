##### trusted/unstrusted:
- repos:
    - name: add local RPM repos (RHEL)
    template:
        src: repos/local.repo.j2
        dest: /etc/yum.repos.d/local.repo
        mode: 0644
        owner: root
        group: root
    tags: secret
    when: inventory_hostnaname not in groups['pxeservers']
    - name: remove cobbler provided repositories (RHEL)
    file:
        name: cobbler-config.repo
        state: absent
###### base_vms:
- scheduler:
    # set noop for virtual machines
    ACTION=="add|change", KERNEL=="[sv]d[a-z]", ATTR{queue/scheduler}="noop"


- include contents of "grzebanie" file

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

