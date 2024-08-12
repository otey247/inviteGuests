Here's a sample README for your PowerShell script that adds guest users to Azure AD:

---

# Azure AD Guest User Invitation Script

This PowerShell script allows you to bulk invite guest users to your Azure Active Directory (Azure AD) by reading user details from an Excel file (`members.xlsx`). The invited users will not be assigned any roles or permissions, ensuring that they have only the basic guest access.

## Features

- **Bulk User Invitation:** The script processes a list of users from an Excel file and sends them invitations to join your Azure AD tenant as guest users.
- **No Role Assignment:** Users are invited without any role access, providing a secure way to give external users limited access to your Azure resources.
- **Customizable:** You can modify the script to change the redirection URL or the invitation message.

## Prerequisites

- **PowerShell 5.1 or later:** Ensure that you have PowerShell installed on your system.
- **AzureAD PowerShell Module:** Install the AzureAD module to interact with Azure Active Directory.

## Installation

1. **Install the AzureAD Module:**

   Open PowerShell with administrative privileges and run the following command:
   ```powershell
   Install-Module -Name AzureAD
   ```

2. **Import the AzureAD Module:**

   Import the module into your session:
   ```powershell
   Import-Module AzureAD
   ```

3. **Connect to Azure AD:**

   Use the following command to authenticate and connect to your Azure AD tenant:
   ```powershell
   Connect-AzureAD
   ```

## Script Usage

1. **Prepare Your Excel File:**

   Create an Excel file named `members.xlsx` with the following structure:

   | Username | EmailAddress     |
   |----------|------------------|
   | User1    | user1@example.com |
   | User2    | user2@example.com |

   Ensure the file is saved in a location accessible by the script.

2. **Run the Script:**

   Run the script in PowerShell:
   ```powershell
   .\InviteGuests.ps1
   ```

## Customization

- **Invite Redirect URL:** Change the URL in the `New-AzureADMSInvitation` cmdlet to direct users to a different page after they accept the invitation.
- **Excel File Path:** Update `$ExcelFilePath` with the correct path to your Excel file.
- **Worksheet Name:** Modify `$WorkSheetName` if your Excel file uses a different worksheet name.

## Troubleshooting

- **Module Not Found:** Ensure that the `AzureAD` module is installed and imported correctly.
- **Execution Policy:** If you encounter an execution policy error, you can temporarily set the policy to allow the script to run:
  ```powershell
  Set-ExecutionPolicy RemoteSigned -Scope Process
  ```

## License

This script is licensed under the MIT License.

