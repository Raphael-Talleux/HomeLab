FROM debian:12-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV MAIL_HOSTNAME=default.local

# Install all dependencies
RUN apt update && \
    apt install -y postfix dovecot-imapd dovecot-pop3d dovecot-lmtpd mailutils mutt gettext-base && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Copy custom config files
COPY config/postfix/main /etc/postfix/main.cf.template

COPY config/Muttrc/Muttrc /etc/Muttrc.template

COPY config/dovecot/dovecot.conf /etc/dovecot/dovecot.conf
COPY config/dovecot/conf.d/ /etc/dovecot/conf.d/

# SMTP (Mail Transfer)
EXPOSE 25 
# SMTP Submission (authenticated)
EXPOSE 587
# IMAP (Incoming Mail)
EXPOSE 993

# Initialisation script
COPY init_container.sh /init_container.sh
RUN chmod +x /init_container.sh

# Startup command
CMD ["/init_container.sh"]