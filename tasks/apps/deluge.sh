#!/bin/bash

FUNCTION="install or update Deluge"

# ---------
# Variables
# ---------

source /opt/GooPlex/menus/variables.sh

# Confirmation

clear
read -p "Are you sure you want to $FUNCTION (y/N)? " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]
then

# ----------
# Open ports
# ----------

sudo ufw allow 8112

# ------------
# Dependencies
# ------------

sudo apt-get upgrade -y && sudo apt-get upgrade -y

sudo apt-get -y install \
  sqlite3 \
  denyhosts at sudo software-properties-common

# -----------
# Main script
# -----------

# Execution

sudo apt-get -y install \
  deluged \
  deluge-webui \
  deluge-console \
  denyhosts at sudo software-properties-common

# -------------------
# Installing Services
# -------------------

if [ -e "/etc/systemd/system/deluged.service" ]

then

echo "Service already configured, skipping"

else

sudo rsync -a /opt/GooPlex/scripts/services/rclone.service /etc/systemd/system/deluged.service
sudo rsync -a /opt/GooPlex/scripts/services/rclone.service /etc/systemd/system/deluge-web.service

sudo systemctl enable deluged.service
sudo systemctl enable deluge-web.service

sudo systemctl daemon-reload

sudo systemctl start deluged.service
sudo systemctl start deluge-web.service

fi

# ----------------
# Creating Folders
# ----------------

if [ -d "/home/plexuser/downloads" ];

then

echo "Download folders already created, skipping"

else

sudo mkdir -p /home/plexuser/downloads/incomplete
sudo mkdir -p /home/plexuser/downloads/import
sudo chown -R plexuser:plexuser /home/plexuser

fi

# ----------
# Finalizing
# ----------

else

  echo -e "You chose ${YELLOW}not${STD} to $FUNCTION"

fi

PAUSE
