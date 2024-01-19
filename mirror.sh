#/bin/bash

apt -y update
DEBIAN_FRONTEND=nointeractive apt -y upgrade

apt install vsftpd dos2unix -y
if ! [[ -e /etc/vsftpd.conf.bak ]]
then
    mv /etc/vsftpd.conf /etc/vsftpd.conf.bak
fi
cp -v /vagrant/Archivos/mirror/* /etc/
cp -v /vagrant/Archivos/readme.txt /srv/ftp/
dos2unix /etc/vsftpd.*
dos2unix /srv/ftp/
chown root:root /etc/vsftpd.*
systemctl restart vsftpd.service