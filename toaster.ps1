[CmdletBinding()]
param(
    [parameter(mandatory)][String]$XmlPath,
    [int]$ExpirationDurationMinutes = $null
)

# Stop processing when any error occured
$ErrorActionPreference = "Stop"

# Refer Windows Runtime
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] > $null
[Windows.UI.Notifications.ToastNotification, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null

# Read toast template xml as [Windows.Data.Xml.Dom.XmlDocument] object
$template = Get-Content $XmlPath
$xml = New-Object Windows.Data.Xml.Dom.XmlDocument
$xml.LoadXml($template)

# Toast notify
$app = '{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe'
$toast = New-Object Windows.UI.Notifications.ToastNotification $xml
if ($ExpirationDurationMinutes -ne $null) {
    $toast.ExpirationTime = $(Get-Date).AddMinutes($ExpirationDurationMinutes)
}
[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($app).Show($toast)
