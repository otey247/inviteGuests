# Import the necessary module
Import-Module AzureAD

# Connect to Azure AD
$tenantId = ""
Connect-AzureAD -TenantId $tenantId

# Path to the Excel file
$ExcelFilePath = "members.xlsx"
$WorkSheetName = "Sheet1" # Adjust according to your worksheet name

# Load Excel file
$Excel = New-Object -ComObject Excel.Application
$Workbook = $Excel.Workbooks.Open($ExcelFilePath)
$Worksheet = $Workbook.Worksheets.Item($WorkSheetName)

# Start reading from the second row (assuming first row is header)
$row = 2

while ($Worksheet.Cells.Item($row, 1).Text -ne "") {
    $UserName = $Worksheet.Cells.Item($row, 1).Text.trim()
    $EmailAddress = $Worksheet.Cells.Item($row, 2).Text.trim()

    # Invite the user as a guest
    try {
        $invitation = New-AzureADMSInvitation -InvitedUserDisplayName $UserName -InvitedUserEmailAddress $EmailAddress -SendInvitationMessage $true -InviteRedirectURL "https://myapps.microsoft.com"
        Write-Host "Invitation sent to $UserName ($EmailAddress)" -ForegroundColor Green
    } catch {
        Write-Host "Failed to invite $UserName ($EmailAddress)" -ForegroundColor Red
    }

    $row++
}

# Cleanup
$Workbook.Close()
$Excel.Quit()
