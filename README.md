# Toaster

Toast Notifier for Windows.

## Installation

```powershell
# Clone to any path. In this example, we clone to C:/toaster.
cd C:\
git clone https://github.com/onokit/toaster

# If you see it working, toast it with the included XML file.
cd toaster
.\toaster.ps1 xml\sample.xml
```

## How to Use

```powershell
toaster.ps1 xml\sample.xml
```

or

```powershell
powershellLauncher.vbs toaster.ps1 xml\sample.xml
```

When you want to launch Toaster with background process, you should use the latter way, since ps1 file can't run as background process with itself.

If you want to specify the execution time in the task scheduler, you can set it as follows:

```powershell
# Set the name of the task.
$TaskName = "my daily task"

# Set the trigger to execute the new task
# In this example, perform tasks at 8:30am daily.
$At = Get-Date -Hour 8 -Minute 30 -Second 0 -Millisecond 0
$Trigger = New-ScheduledTaskTrigger -Daily -At $At

# Set the action to start a program.
$Action = New-ScheduledTaskAction `
    -Execute "C:\toaster\powershellLauncher.vbs" `
    -Argument "toaster.ps1 xml\sample.xml" `
    -WorkingDirectory "C:\toaster"

# Register the new task.
Register-ScheduledTask -TaskName $TaskName -Trigger $Trigger -Action $Action

# Show the next run time.
Get-Scheduledtaskinfo -TaskName $TaskName
```

Of course, you can also register it in the task scheduler.

## Reference

<https://docs.microsoft.com/en-us/windows/uwp/design/shell/tiles-and-notifications/toast-xml-schema>
<https://docs.microsoft.com/en-us/windows/uwp/design/shell/tiles-and-notifications/adaptive-interactive-toasts>
