#/bin/bash

apt -y update
DEBIAN_FRONTEND=nointeractive apt -y upgrade

apt install vsftpd dos2unix -y
if ! [[ -e /etc/vsftpd.conf.bak ]]
then
    mv /etc/vsftpd.conf /etc/vsftpd.conf.bak
fi
cp -v /vagrant/Archivos/ftp/* /etc/
dos2unix /etc/vsftpd.*
chown root:root /etc/vsftpd.*
if ! [[ -e /etc/ssl/private/vsftpd.pem ]]
then
    cp -v /vagrant/Archivos/vsftpd.pem /etc/ssl/private
fi
systemctl restart vsftpd.service
useradd charles -m
echo -e "charles\ncharles\n" | passwd charles
useradd laura -m
echo -e "laura\nlaura\n" | passwd laura