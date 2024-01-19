apt -y update
DEBIAN_FRONTEND=nointeractive apt -y upgrade

apt install bind9 -y

cp -v /vagrant/Archivos/ns/named /etc/default/
cp -v /vagrant/Archivos/ns/named.conf.options /etc/bind
cp -v /vagrant/Archivos/ns/named.conf.local /etc/bind
cp -v /vagrant/Archivos/ns/sistema.sol.dns /var/lib/bind
cp -v /vagrant/Archivos/ns/192.168.57.dns /var/lib/bind

systemctl restart bind9