#!/bin/bash

# Script to remove Apache web server

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Use sudo." 
   exit 1
fi

# Function to remove Apache
remove_apache() {
    echo "Stopping and disabling Apache service..."
    systemctl stop httpd
    systemctl disable httpd

    echo "Removing Apache web server..."
    dnf remove httpd -y

    echo "Removing Apache configuration and web directory..."
    rm -rf /etc/httpd
    rm -rf /var/www/html
}

# Execute the function
remove_apache

echo "Apache has been successfully removed."
