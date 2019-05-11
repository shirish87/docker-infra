#!/bin/bash -e

# passwords generated with: openssl passwd -1 'password'
input="$(dirname "$0")/users.txt"
pam="/etc/security/access.conf"

while IFS=: read -r USER PWD
do
  getent passwd "$USER" || adduser "$USER"
  echo -n "$USER:$PWD" | chpasswd -e
  [ ! -z "$1" ] && getent group "$1" && usermod -aG "$1" "$USER"
  [ -f "$pam" ] && echo "+:$USER:ALL" >> "$pam"
done < "$input"
