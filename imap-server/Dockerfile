FROM debian:12-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install all dependencies
RUN apt update && \
    apt install -y dovecot-imapd dovecot-pop3d dovecot-lmtpd dovecot-mysql mailutils mutt gettext-base && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Add maildir permissions
RUN groupadd -g 5000 vmail
RUN useradd -r -u 5000 -g 5000 -d /var/mail vmail
RUN chown -R vmail:vmail /var/mail


# Copy custom config files
COPY .dovecot-config /etc/dovecot


# IMAP and IMAPS
EXPOSE 143
EXPOSE 993

# Initialisation script
COPY init.sh /init.sh
RUN chmod +x /init.sh

# Startup command
CMD ["/init.sh"]




