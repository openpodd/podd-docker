#!/bin/bash
set -e

bash postgis.sh

TARGET_UID=$(stat -c "%u" /var/lib/postgresql/data)
usermod -o -u $TARGET_UID postgres || true
TARGET_GID=$(stat -c "%g" /var/lib/postgresql/data)
groupmod -o -g $TARGET_GID postgres || true
chown -R postgres:postgres /var/lib/postgresql/data/
