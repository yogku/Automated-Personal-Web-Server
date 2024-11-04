
# Setup Guide for Personal Web Server Using Apache on Red Hat Linux

## Introduction
This guide provides detailed steps to install and configure Apache HTTP Server on Red Hat Enterprise Linux, enabling you to host a simple webpage. Follow each step carefully to ensure a successful setup.

## Prerequisites
- A working installation of Red Hat Enterprise Linux on VMware.
- Internet connection to download packages and updates.

## Step 1: Install Red Hat Linux on VMware
1. Download the Red Hat Enterprise Linux Developer Edition.
2. Install VMware Workstation or VMware Player on your system.
3. Create a new virtual machine and allocate appropriate resources (CPU, RAM, Disk Space).
4. Follow the installation prompts to complete the installation of Red Hat Linux.

## Step 2: Update the System
After logging into the Red Hat Linux system, open the terminal and run the following command to update the system:
```bash
sudo dnf update
```

## Step 3: Install Apache Web Server
To install the Apache HTTP Server, execute the following command in the terminal:
```bash
sudo dnf install httpd
```

### Step 4: Start and Enable Apache Service
After installation, start the Apache service and enable it to run on boot using the commands below:
```bash
sudo systemctl start httpd
sudo systemctl enable httpd
```

### Step 5: Configure Firewall
Allow HTTP traffic through the firewall with the following commands:
```bash
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
```

### Step 6: Create a Custom Webpage
1. Navigate to the Apache root directory:
   ```bash
   cd /var/www/html/
   ```
2. Create a new HTML file for your webpage:
   ```bash
   sudo nano index.html
   ```
3. Add your HTML content and save the file.

### Step 7: Set File Permissions
Ensure that the file has the appropriate permissions:
```bash
sudo chown apache:apache /var/www/html/index.html
```

## Step 8: Access the Web Server
Open a web browser and access your webpage using the server's IP address:
```
http://<your-server-ip>
```

## Conclusion
By following this setup guide, you will have a fully functional web server using Apache on Red Hat Linux, hosting your custom webpage. Ensure to explore additional configurations and security measures for production environments.
