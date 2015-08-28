#!/bin/bash

#ssh key for login to UCS server
keys="-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAxxxfc/xj8etUnFZq/2y+dNGAxVaIHjym166+fb5bsNWgt4yt
XbZ/6PlDXfO5qQ/3lZpX+5045BcQrvKpeN1a5pQA+RpuWW+qrqcDx8yr3WxaJTI4
K6UDEgee7Cnzz2vSM0+bil3DmsBzUFDY56r8LAvyE30AaYum0ppZItXhFC4xP9gi
5nsCE7E+5wiV3ZmFJhZPGVUlsKSIfXtHNgo6TIax4fwYJk5qtjayvAcnTuAzI0ih
+xmPPQUuvnAf/Jdyx8Oa2eSbDJGCdCwZpFU9Yl0UakUZtPJBjwpksa+7CvMGzprr
+bKTVuT7MOuBQ8uxGJeqiQOdySdESYu+1ZY+9wIDAQABAoIBACdunAzJWDXJ6EjJ
6IjLTXCvKPRr7asnUdd3GOyoLVp5BEo1hwP/J5fI/al2ojc0HVE4buI6wdCSLNCo
6B0yoVT2zLaIoH//2GqcUuhXxVWlprilGHC0TkZc0gFtUYarkMZuppwhc6KLKIso
Z7yBpU1H1Fo9sD421QPyY2K9vsSTA0QRTgCl6Ytj0L+xmAe5/rxuCg0GBNEzsSot
TLrx2ozpkexNVlLS+UkXZbAx2fW8lZn3N2pk/YQ1nb8vHMKLeYF+arS2Dl8yJRN8
2/xtlDtglx5rn9mtBRGCHbw0nWAagERagVbkFocu3nnlobzAP1w+ZlpvzDrn7P4f
9Ev/BjECgYEA/r2356Hc3iAoW5iOq1dbXhPdo7u696FX0mht9MUJ3WNN0qXOrbrm
GMEU9HqkgwJu2++rB4Bub6h+b7OG/VXE/8mNHZt87jKfP2G0iR52OeEaPM9dCdlc
4mipV62hzP2Ww9ekDKGsPvANoJruOqN/8BPWqXoXrtiHd3bBRwzEQLkCgYEAyBhG
VlSdn7HdqN+eoNQdAcOvJJvevojywwYclyLIl8rTKF/zsMC1a3WpJ2m69qzDzPvH
tP8Cdre2LwpXag9V+A2KQPvhSvSQU31pq1yi8Mmc5JpmEwcEx2G5udUpxNqcz70t
UTQjVe9THCnb/RtLz5rR9IRWLJ+OB9ZNhtXAxS8CgYBY5S/GH1AKG8K5pBU1abiy
rdAMkTh/rcgN3u9wGUqF/V9tAPuM2MnvHYIIhrveE/1Htu1CIulnAa+Nn2KeCU5D
zLv39wizvuqfnaL4rq6nKAyV5+8ZvsaRI+Dkfe0Wse/oy9mtpsWK+Q5oW2iDAgdl
aibg4YBePaWYZNKxzpy10QKBgQCqfpSgRuUwB3xZwoEFhPdaY4S+6tl2/HXt2y1N
UmQdgsM9qdSZDPsIn28MmDioqzkDVp4qCQfuZEcl+efWBU85V0Awcu7a0VyQ51G8
o+hqxz+aQj0rhVV7FjgMsicvBx+KmyUcBhL9zDjCzKAYIMQOF1tCv+g1iZaZ8u6I
L2ZcHQKBgFYQ/D8wIJeKKuEsilqzpyhhFvh3Yc0/3DlKZp75TQqZLtVKQAUsFzkA
08c5TN2e6cyC3vQjqNC6UrADa8d1zdGcRlKoc0qn5rF1RhOTFCdcLHg6+il2gwrc
QO/7FvsDTADiEYQ/qy5AvS0iTK20Ihu2tfCUG4qBa8eM+RZ7sxeo
-----END RSA PRIVATE KEY-----"


clear
echo "Welcome to the Univention Client Setup Script!"
echo "Starting installation process now..."

export MASTER_IP=192.168.128.239
sudo mkdir /etc/univention

#Create temporary ssh key
echo "Copying over UCS master domain controller configuration file"
sudo mkdir /tmp/key/
sudo echo "$keys" > /tmp/key/keys
sleep 5
sudo chmod 600 /tmp/key/keys

#Copy UCS server config files to client machine 
ssh -i /tmp/key/keys -o StrictHostKeyChecking=no root@${MASTER_IP} ucr shell | grep -v ^hostname= >/etc/univention/ucr_master
sleep 5
sudo echo "master_ip=${MASTER_IP}" >>/etc/univention/ucr_master

#Setting some environmental variables
echo "Setting some environmental variables..."
sudo chmod 660 /etc/univention/ucr_master
. /etc/univention/ucr_master

#Add master to host file
echo "${MASTER_IP} ${ldap_master}" >>/etc/hosts

#Download the SSL certificate
echo "Downloading SSL certificates..."
sudo mkdir -p /etc/univention/ssl/ucsCA/
sudo wget -O /etc/univention/ssl/ucsCA/CAcert.pem \
    http://${ldap_master}/ucs-root-ca.crt

sleep 5
# Create an account and save the password
echo "Creating an account and saving the password."
password="$(tr -dc A-Za-z0-9_ </dev/urandom | head -c20)"

if [ "$version_version" = 3.0 ] && [ "$version_patchlevel" -lt 2 ]
then
    ssh -i /tmp/key/keys -o StrictHostKeyChecking=no root@${ldap_master} udm computers/managedclient create \
        --position "cn=computers,${ldap_base}" \
        --set name=$(hostname) --set password="${password}"
else
    ssh -i /tmp/key/keys -o StrictHostKeyChecking=no root@${ldap_master} udm computers/ubuntu create \
        --position "cn=computers,${ldap_base}" \
        --set name=$(hostname) --set password="${password}" \
        --set operatingSystem="$(lsb_release -is)" \
        --set operatingSystemVersion="$(lsb_release -rs)"
fi
sleep 5
sudo printf '%s' "$password" >/etc/ldap.secret
sudo chmod 0400 /etc/ldap.secret


# Create ldap.conf
echo "Creating the ldap configuration files."
sleep 5

sudo cat >/etc/ldap/ldap.conf <<__EOF__
TLS_CACERT /etc/univention/ssl/ucsCA/CAcert.pem
URI ldap://$ldap_master:7389
BASE $ldap_base
__EOF__


# Install SSSD based configuration
echo "Installing SSS software and dependencies..."
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install sssd
sleep 5
sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq libnss-sss libpam-sss libsss-sudo
sleep 5

#create sssd.conf
echo "Writing SSSD configuration files..."
sleep 5

sudo cat >/etc/sssd/sssd.conf <<__EOF__
[sssd]
config_file_version = 2
reconnection_retries = 3
sbus_timeout = 30
services = nss, pam, sudo
domains = $kerberos_realm

[nss]
reconnection_retries = 3

[pam]
reconnection_retries = 3

[domain/$kerberos_realm]
auth_provider = krb5
krb5_kdcip = ${master_ip}
krb5_realm = ${kerberos_realm}
krb5_server = ${ldap_master}
krb5_kpasswd = ${ldap_master}
id_provider = ldap
ldap_uri = ldap://${ldap_master}:7389
ldap_search_base = ${ldap_base}
ldap_tls_reqcert = never
ldap_tls_cacert = /etc/univention/ssl/ucsCA/CAcert.pem
cache_credentials = true
enumerate = true
ldap_default_bind_dn = cn=$(hostname),cn=computers,${ldap_base}
ldap_default_authtok_type = password
ldap_default_authtok = $(cat /etc/ldap.secret)
__EOF__

sleep 5 
sudo chmod 600 /etc/sssd/sssd.conf


# Install auth-client-config
echo "Installing auth-client-config software..."
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install auth-client-config
sleep 5

# Create an auth config profile for sssd
echo "Writing auth configuration files..."
sleep 5

sudo cat >/etc/auth-client-config/profile.d/sss <<__EOF__
[sss]
nss_passwd=   passwd:   compat sss
nss_group=    group:    compat sss
nss_shadow=   shadow:   compat
nss_netgroup= netgroup: nis

pam_auth=
        auth [success=3 default=ignore] pam_unix.so nullok_secure try_first_pass
        auth requisite pam_succeed_if.so uid >= 500 quiet
        auth [success=1 default=ignore] pam_sss.so use_first_pass
        auth requisite pam_deny.so
        auth required pam_permit.so

pam_account=
        account required pam_unix.so
        account sufficient pam_localuser.so
        account sufficient pam_succeed_if.so uid < 500 quiet
        account [default=bad success=ok user_unknown=ignore] pam_sss.so
        account required pam_permit.so

pam_password=
        password sufficient pam_unix.so obscure sha512
        password sufficient pam_sss.so use_authtok
        password required pam_deny.so

pam_session=
        session required pam_mkhomedir.so skel=/etc/skel/ umask=0077
        session optional pam_keyinit.so revoke
        session required pam_limits.so
        session [success=1 default=ignore] pam_sss.so
        session required pam_unix.so
__EOF__

sleep 5
sudo auth-client-config -a -p sss
sleep 5 
# Restart sssd
echo "Restarting sssd service..."
sudo restart sssd
sleep 5
#Configure user logins
echo "Configuring user logins..."

sudo cat >/usr/share/pam-configs/ucs_mkhomedir <<__EOF__
Name: activate mkhomedir
Default: yes
Priority: 900
Session-Type: Additional
Session:
    required    pam_mkhomedir.so umask=0022 skel=/etc/skel
__EOF__

sudo DEBIAN_FRONTEND=noninteractive pam-auth-update --force

#Configure user groups
sudo echo "Configuring user groups..."

sudo echo '*;*;*;Al0000-2400;audio,cdrom,dialout,floppy,plugdev,adm' \
   >>/etc/security/group.conf

sudo cat >>/usr/share/pam-configs/local_groups <<__EOF__
Name: activate /etc/security/group.conf
Default: yes
Priority: 900
Auth-Type: Primary
Auth:
    required    pam_group.so use_first_pass
__EOF__

sudo DEBIAN_FRONTEND=noninteractive pam-auth-update --force

echo "Installing and configuring Kerberos..."
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y heimdal-clients

# Default krb5.conf
sudo cat >/etc/krb5.conf <<__EOF__
[libdefaults]
    default_realm = $kerberos_realm
    kdc_timesync = 1
    ccache_type = 4
    forwardable = true
    proxiable = true

[realms]
$kerberos_realm = {
   kdc = $master_ip $ldap_master
   admin_server = $master_ip $ldap_master
}
__EOF__

# Stop and disable the avahi daemon
sudo stop avahi-daemon
sleep 5
sed -i 's|start on (|start on (never and |' /etc/init/avahi-daemon.conf

# Synchronize the time with the UCS system
echo "Synchronizing the time with the UCS system..."

sudo ntpdate -bu $ldap_master

echo "Cleaning up..."
sudo rm -f /tmp/key/keys
sudo rmdir /tmp/key/

touch /var/log/uni.log

echo "Installation is complete. Reboot now!"
