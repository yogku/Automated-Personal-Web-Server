#!/bin/bash

# Script to automate Apache installation and webpage setup

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Use sudo." 
   exit 1
fi

# Update the system
echo "Updating the system..."
dnf update -y

# Install Apache Web Server
echo "Installing Apache Web Server..."
dnf install httpd -y

# Start and enable Apache to run on boot
echo "Starting and enabling Apache service..."
systemctl start httpd
systemctl enable httpd

# Open firewall for HTTP traffic
echo "Configuring the firewall for HTTP traffic..."
firewall-cmd --permanent --add-service=http
firewall-cmd --reload
``
# Create a simple webpage
echo "Creating a custom webpage..."
WEB_DIR="/var/www/html"
echo "<html>
<head>
    <title>My Custom Webpage</title>
</head>
<body>
    <h1>Welcome to My Custom Webpage!</h1>
    <p>This webpage is hosted on an Apache web server running on Red Hat Linux.</p>
</body>
</html>" > $WEB_DIR/index.html

# Set proper ownership and permissions
echo "Setting proper ownership and permissions for the webpage..."
chown apache:apache $WEB_DIR/index.html
chmod 644 $WEB_DIR/index.html

# Restart Apache service to apply changes
echo "Restarting Apache service..."
systemctl restart httpd

# Provide information to the user
IP_ADDRESS=$(hostname -I | awk '{print $1}')
echo "Web server setup is complete!"
echo "You can access the webpage at: http://$IP_ADDRESS"

# Done
echo "Automation completed successfully!"
