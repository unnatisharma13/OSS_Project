#!/bin/bash
# Script 1: System Identity Report
# Author: Unnati Sharma
# Registration: 24BCE11097
# Course: Open Source Software
# Description: Generates a welcome screen detailing the system identity.

# --- Variables ---
STUDENT_NAME="Unnati Sharma"
SOFTWARE_CHOICE="Git"

# System info using command substitution $()
KERNEL=$(uname -r)
USER_NAME=$(whoami)
HOST_NAME=$(hostname)

# macOS uses 'sw_vers' instead of /etc/os-release
DISTRO=$(sw_vers -productName)
OS_VERSION=$(sw_vers -productVersion)

# macOS uptime needs different parsing than Linux
UPTIME=$(uptime | awk -F'up ' '{print $2}' | awk -F',' '{print $1}' | xargs)

CURRENT_DATE=$(date "+%A, %d %B %Y %T")

# --- Display ---
echo "=========================================="
echo "         The Open Source Audit            "
echo "=========================================="
echo "Student    : $STUDENT_NAME"
echo "Software   : $SOFTWARE_CHOICE"
echo "------------------------------------------"
echo "OS         : $DISTRO $OS_VERSION"
echo "Kernel     : $KERNEL"
echo "Hostname   : $HOST_NAME"
echo "User       : $USER_NAME"
echo "Home Dir   : $HOME"
echo "Uptime     : $UPTIME"
echo "Date/Time  : $CURRENT_DATE"
echo "------------------------------------------"
echo "OS License : macOS is built on BSD Unix"
echo "             (Apple Public Source License)"
echo "Git License: GNU General Public License v2"
echo "             Same license as the Linux kernel"
echo "=========================================="
