# Stop processing when any error occured
$ErrorActionPreference = "Stop"

# Refer Windows Runtime
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] > $null
[Windows.UI.Notifications.ToastNotification, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null

# Read toast template xml as [Windows.Data.Xml.Dom.XmlDocument] object
$template = Get-Content $Args[0]
$xml = New-Object Windows.Data.Xml.Dom.XmlDocument
$xml.LoadXml($template)

# Toast notify
$app = '{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe'
$toast = New-Object Windows.UI.Notifications.ToastNotification $xml
[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($app).Show($toast)
