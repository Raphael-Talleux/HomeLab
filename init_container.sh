#!/bin/bash
set -e

# Set the mail domain name for Postfix
echo "$MAIL_HOSTNAME" > /etc/mailname

# Inject Docker environment variables into configuration files
envsubst '${MAIL_HOSTNAME}' < /etc/postfix/main.cf.template > /etc/postfix/main.cf
envsubst '${MAIL_HOSTNAME}' < /etc/Muttrc.template > /etc/Muttrc

# Define mail users and their passwords
USERS=(
    "pro:123"
    "perso:123"
)

# Loop through each user to create system accounts and Maildirs
for entry in "${USERS[@]}"; do
    MAIL_USER="${entry%%:*}"
    MAIL_PASSWORD="${entry##*:}"

    if [ -n "$MAIL_USER" ] && [ -n "$MAIL_PASSWORD" ]; then
        # Check user is already set
        if ! id "$MAIL_USER" &>/dev/null; then
            useradd -m -s /bin/bash "$MAIL_USER"
        fi

        # Define password
        echo "$MAIL_USER:$MAIL_PASSWORD" | chpasswd

        # Create Maildir directories and set ownership
        mkdir -p /home/"$MAIL_USER"/Maildir/{cur,new,tmp}
        chown -R "$MAIL_USER:$MAIL_USER" /home/"$MAIL_USER"/Maildir

        echo "Utilisateur $MAIL_USER créé avec succès."
    fi
done


# Start Postfix and Dovecot services
service postfix start
service dovecot start

# Keep the container running
tail -f /dev/null