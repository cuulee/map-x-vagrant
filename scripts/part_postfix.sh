#!/bin/bash

# doc found on
# https://www.linode.com/docs/email/postfix/postfix-smtp-debian7
# https://www.howtoforge.com/postfix_relaying_through_another_mailserver
export DEBIAN_FRONTEND=noninteractive;
apt-get -qy purge mailutils postfix
apt-get install -qy postfix mailutils
# postfix config
postconf -e "relayhost = [$relayhost]:$relayport"
postconf -e "smtp_sasl_auth_enable = yes"
postconf -e "smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd"
postconf -e "smtp_sasl_security_options = noanonymous"
echo "$relayhost  $mailmapx:$pwdmailmapx" | tee -a /etc/postfix/sasl_passwd
chown root:root /etc/postfix/sasl_passwd
chmod 600 /etc/postfix/sasl_passwd
postmap /etc/postfix/sasl_passwd
/etc/init.d/postfix restart
echo "postfix has been installed" | mail -s "map-x provisioning" -a "From: $mailmapx" $mailadmin

