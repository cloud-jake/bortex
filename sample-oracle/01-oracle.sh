#!/bin/bash

sudo su -

yum update -y


# 2. Next, installed all the required dependencies for the RDBMS, along with the zip and unzip packages.
yum install -y binutils.x86_64 compat-libcap1.x86_64 gcc.x86_64 gcc-c++.x86_64 glibc.i686 glibc.x86_64 glibc-devel.i686 glibc-devel.x86_64 ksh compat-libstdc++-33 libaio.i686 libaio.x86_64 libaio-devel.i686 libaio-devel.x86_64 libgcc.i686 libgcc.x86_64 libstdc++.i686 libstdc++.x86_64 libstdc++-devel.i686 libstdc++-devel.x86_64 libXi.i686 libXi.x86_64 libXtst.i686 libXtst.x86_64 make.x86_64 sysstat.x86_64 zip unzip


# Install PAckages

# compat-libcap1-1.10-7.el7.x86_64.rpm
# compat-libstdc++-33-3.2.3-72.el7.x86_64.rpm
# oracle-database-preinstall-19c-1.0-1.el7.x86_64.rpm

curl https://yum.oracle.com/repo/OracleLinux/OL7/latest/x86_64/getPackage/oracle-database-preinstall-19c-1.0-3.el7.x86_64.rpm --output oracle-database-preinstall-19c-1.0-3.el7.x86_64.rpm

yum localinstall -y oracle-database-preinstall-19c-1.0-3.el7.x86_64.rpm 


# 6. Before proceeding, create other directories that will be used during the actual installation, and assign the necessary permissions.
mkdir /u01 /u02
mkdir -p /u01/app/oracle/product/19.0.0/dbhome_1
mkdir -p /u02/oradata
chown -R oracle:oinstall /u01 /u02
chmod -R 775 /u01 /u02
chmod g+s /u01 /u02


#copy Oracle Installer
su - oracle
cd /u01/app/oracle/product/19.0.0/dbhome_1/
gsutil cp gs://bortex-oracle/LINUX.X64_193000_db_home.zip .
unzip LINUX.X64_193000_db_home.zip
exit

# How can I install X Windows on CentOS 7?
#yum groupinstall "GNOME Desktop"  
#
#yum groupinstall "Graphical Administration Tools"  

# ... 
#systemctl enable graphical.target 
#systemctl start graphical.target 

# <gui should start>
#systemctl set-default graphical.target 
#systemctl get-default 
#systemctl reboot 








7. Open a GUI session in the RHEL/CentOS 7 server and launch the installation script.
# ./runInstaller

# Swap
sudo dd if=/dev/zero of=/swapfile count=32768 bs=1MiB
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
free -m


To make this permanent add this to /etc/fstab

/swapfile none swap sw 0 0

echo "add oracle to group oinstall"
