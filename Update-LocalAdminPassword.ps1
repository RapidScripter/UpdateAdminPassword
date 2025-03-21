# Prompt user for a specific admin username
$usernameInput = Read-Host "Enter admin username (leave blank to update all)"

# Define the new password
$newPassword = "YourSecureP@ssword"  # Change this to the desired password

# Convert password to SecureString
$securePassword = ConvertTo-SecureString -String $newPassword -AsPlainText -Force

# Get all local administrator accounts
$admins = Get-LocalGroupMember -Group "Administrators" | Where-Object { $_.ObjectClass -eq "User" }

# If username is provided, update only that account
if ($usernameInput) {
    Try {
        Set-LocalUser -Name $usernameInput -Password $securePassword
        Write-Host "Password changed successfully for $usernameInput"
    } Catch {
        $errorMsg = $_.Exception.Message
        Write-Host "Failed to change password for $usernameInput : $errorMsg"
    }
} else {
    # Change password for all admin accounts
    foreach ($admin in $admins) {
        # Extract only the username (remove computer/domain prefix)
        $username = $admin.Name -replace '^.+\\', ''  

        Try {
            Set-LocalUser -Name $username -Password $securePassword
            Write-Host "Password changed successfully for $username"
        } Catch {
            $errorMsg = $_.Exception.Message
            Write-Host "Failed to change password for $username : $errorMsg"
        }
    }
}