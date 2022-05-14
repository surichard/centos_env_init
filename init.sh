#!/bin/bash
set -e
# Created by Richard
# MAIL:richar.su@163.com
cat << EOF
+--------------------------------------------------------------+
|         === Welcome to Centos System init ===                |
+--------------------------------------------------------------+
+--------------------------by Richard--------------------------+
EOF
#run check root
if [ "$UID" != "0" ]; then
    echo "Please run this script by root"
    exit 1
fi
#### 1.install epel repo
mod_yum() {
    if [ -e /etc/yum.repos.d/CentOS-Base.repo ]; then
        cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.default
        yum install -y epel-release  && yum clean all && yum makecache && yum -y update
    fi
}

#### 4. install software
install_softwares() {
    # 1
    if [ `rpm -qa vim lrzsz wget nmap nc tree curl tcpdump sysstat lsof net-tools ntpdate htop nload open-vm-tools yum-plugin-priorities|wc -l` -lt 17 ]; then
        yum -y install vim lrzsz wget nmap nc tree curl tcpdump sysstat lsof net-tools ntpdate dos2unix htop nload open-vm-tools yum-plugin-priorities
    fi
    # 0
    yum groups install "Development Tools" -y
}

#### 7. Configure environment variables
com_line_set() {
    if [ `egrep 'TMOUT|HISTSIZE|HISTFILESIZE' /etc/profile|wc -l` ]; then
        # Set session timeout
        echo 'export TMOUT=1800' >> /etc/profile
        # History command output record line number
        echo 'export HISTSIZE=1000' >> /etc/profile
        # The total number of records saved by the history command
        echo 'export HISTFILESIZE=1000' >> /etc/profile
        # History command output format
        echo  'export HISTTIMEFORMAT="%F %T `whoami` "' >> /etc/profile
        source /etc/profile
    fi
}

main() {
    mod_yum
    install_softwares
    com_line_set
}

main


