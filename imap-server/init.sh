#!/bin/bash
set -e

# Start Dovecot service
service dovecot start

# Keep the container running
tail -f /dev/null