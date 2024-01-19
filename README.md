This file contains an explanation of the configuration files por the FTP servers in sri.ies. We will include one master dns server (ns.sri.es.).
### /etc/vsftpd.conf (mirror.sri.ies.)
The mirror server is used for anonymous conections. Local users and write permissions are disabled.
```
listen=YES
ftpd_banner=Welcome to SRI FTP anonymous server

# Anonymous user options
anonymous_enable=YES
no_anon_password=YES
anon_max_rate=5000
  
# Local user options
local_enable=NO

# Network options
data_connection_timeout=30
```
### /etc/vsftpd.conf (ftp.sri.ies.)
The ftp server is used for local users. Anonymous conections are prohibited. Every local user is chrooted except for the ones included in the list (/etc/vsftpd.chroot_list), so if we add a new user it is chrooted by default. The server has a certificate for secure ftp conections, which are required in order to conect to this server.
```
listen=YES
ftpd_banner=Welcome to SRI FTP server
  
# Anonymous user options
anonymous_enable=NO

# Local user options
local_enable=YES
write_enable=YES

# Lockdown options
chroot_local_user=YES
chroot_list_enable=YES
chroot_list_file=/etc/vsftpd.chroot_list
allow_writeable_chroot=YES

# Enabling TLS/SSL
ssl_enable=YES

#Force the use of TLS/SSL for local users
force_local_data_ssl=YES
force_local_logins_ssl=YES

# Use protocols SSLv2 and TLSv1
ssl_sslv2=YES
ssl_tlsv1=YES

# Server certificate path
rsa_cert_file=/etc/ssl/private/vsftpd.pem
rsa_private_key_file=/etc/ssl/private/vsftpd.pem

# Options that some FTP clients may require
ssl_ciphers=HIGH
require_ssl_reuse=NO
```
### The importance of encryption in file transfer
Encryption plays a crucial role in file transfer, and its importance cannot be overstated in today's digital landscape. It is a fundamental component of secure file transfer, providing confidentiality, integrity, and authentication. Its adoption is essential for organizations seeking to protect sensitive information and maintain the trust of their users and partners in an increasingly interconnected digital world.
### Testing the mirror server
We tested the conecction to the mirror server with both active and passive conection modes. Both tests were successful. We also tested that only anonymous users are able to connect. The banner shows properly. We can also see the ascii art file.
![[Pasted image 20240113201744.png]]
![[Pasted image 20240113202109.png]]
![[Pasted image 20240113202258.png]]
![[Pasted image 20240113202648.png]]
### Testing the ftp server
We tried conection using non secure ftp and the server refused the conection as expected. The banner shows properly. We tested secure conections using filezilla, a graphic client for ftp. The client asked if we trust the server certificate. We were able to login with both the local users and laura was not chrooted. The server refuses anonymous conections.
![[Pasted image 20240113203518.png]]
![[Pasted image 20240113204700.png]]
![[Pasted image 20240113204835.png]]
![[Pasted image 20240113205041.png]]
![[Pasted image 20240113205301.png]]
