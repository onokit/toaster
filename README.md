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

## Reference

<https://docs.microsoft.com/en-us/windows/uwp/design/shell/tiles-and-notifications/toast-xml-schema>
<https://docs.microsoft.com/en-us/windows/uwp/design/shell/tiles-and-notifications/adaptive-interactive-toasts>
