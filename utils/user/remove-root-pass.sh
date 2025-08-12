#!/bin/bash
set -e

echo "Removing root password (setting it to empty)..."

if [[ $EUID -ne 0 ]]; then
  echo "Please run as root or with sudo"
  exit 1
fi

passwd -d root

echo "Root password removed. Now root can login without a password (if PAM/configuration это позволяет)."
