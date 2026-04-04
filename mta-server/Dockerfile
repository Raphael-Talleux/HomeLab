FROM debian:12-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV MAIL_HOSTNAME=default.local

# Install all dependencies
RUN apt update && \
    apt install -y postfix gettext-base && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Copy custom config files
#COPY config/postfix/main /etc/postfix/main.cf.template

# SMTP
EXPOSE 25 
EXPOSE 587

# Initialisation script
COPY init.sh /init.sh
RUN chmod +x /init.sh

# Startup command
CMD ["/init.sh"]