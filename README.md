# 24CAP-607-Linux-Project
This is the repo for the College Project of Linux


# Personal Web Server Setup Using Apache on Red Hat Linux

## Project Overview
This project demonstrates the setup of a personal web server using Apache on Red Hat Enterprise Linux. It covers the installation, configuration, and deployment of a custom HTML webpage.

## Installation and Setup Guide

### 1. Install Red Hat Linux on VMware
- Download the Red Hat Enterprise Linux Developer Edition.
- Install VMware Workstation or VMware Player.
- Create a new virtual machine and allocate appropriate resources.
- Follow the steps to install Red Hat Linux.

### 2. Update the System
Once Red Hat Linux is installed, update the system to the latest packages using:
```bash
sudo dnf update
```

### 3. Install Apache Web Server
Install Apache using the following command:
```bash
sudo dnf install httpd
```
Start and enable Apache service:
```bash
sudo systemctl start httpd
sudo systemctl enable httpd
```

### 4. Configure Firewall
Allow HTTP traffic by configuring the firewall:
```bash
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
```

### 5. Create and Host Custom Webpage
- Navigate to `/var/www/html/`.
- Create a custom HTML webpage and save it as `index.html`:
```bash
sudo nano /var/www/html/index.html
```
- Ensure the file has the correct permissions:
```bash
sudo chown apache:apache /var/www/html/index.html
```

### 6. Access the Web Server
You can access the webpage by navigating to the server’s IP address in a browser:
```
http://<your-server-ip>
```

## Results
The Apache web server successfully hosts the custom webpage, accessible via the IP address of the server.

## Repository Contents
- `index.html`: The custom webpage deployed on the web server.
- `setup_guide.md`: Step-by-step guide to setting up the web server.
- `screenshots/`: A folder containing images of the setup process.
- `setup_webserver.sh`: A Script that automates the process of server creation.

## Conclusion
This project successfully demonstrates how to set up a personal web server using Apache on Red Hat Linux. The server is configured to serve static content, and basic web server management is covered.

