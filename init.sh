#!/bin/bash
# Created by Richard
# MAIL:richar.su@163.com
cat << EOF
+--------------------------------------------------------------+
|         === Welcome to Centos System init ===                |
+--------------------------------------------------------------+
+--------------------------by Richard--------------------------+
EOF
#set ntp
yum install epel-release -y

#history time
if ! grep HISTTIMEFORMAT /etc/profile; then
    echo 'export HISTTIMEFORMAT="%F %T `whoami` "' >> /etc/profile
fi

