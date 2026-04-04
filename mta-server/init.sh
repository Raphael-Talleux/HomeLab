#!/bin/bash
set -e

# Set the mail domain name for Postfix
echo "$MAIL_HOSTNAME" > /etc/mailname

# Inject Docker environment variables into configuration files
#envsubst '${MAIL_HOSTNAME}' < /etc/postfix/main.cf.template > /etc/postfix/main.cf


# Start Postfix
service postfix start

tail -f /dev/null