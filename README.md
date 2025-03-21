# UpdateAdminPassword - Change Local Administrator Password (User Prompt Option)

## Overview

This PowerShell script allows you to change the password for a specific local administrator account or all local administrators if no username is provided. It securely updates the password and provides success or failure messages.

### Features

- Prompts user to enter an admin username.
- If no username is entered, updates passwords for all local admin accounts.
- Uses `ConvertTo-SecureString` for secure password handling.
- Logs success and failure messages.

### Prerequisites

- Windows operating system
- PowerShell (Run as Administrator)
- Local administrator privileges

### Usage

- Open PowerShell with Administrator privileges.
- Copy and paste the script into the PowerShell window.
- Modify the $newPassword variable to set the desired password.
- Run the script and enter a specific admin username or leave it blank to update all admin accounts.

### Notes

- Ensure the new password meets Windows security requirements.
- Be cautious when running this script in a domain environment.
- Test on a non-production machine before deploying widely.
