# Creating a Desktop Shortcut for ZALAMATI

## Quick Setup Instructions

### Method 1: Simple Right-Click Shortcut
1. Right-click on `launch_zalamati.ps1` in File Explorer
2. Select "Create shortcut"
3. Move the shortcut to your Desktop
4. Rename it to "ZALAMATI - Fast Learning"
5. Right-click the shortcut → Properties → Change Icon
6. Browse to select `zalamati_icon.ico` (if you have one)

### Method 2: PowerShell Shortcut (Recommended)
1. Right-click on Desktop → New → Shortcut
2. For location, enter:
   ```
   powershell.exe -ExecutionPolicy Bypass -File "C:\Users\shadi\OneDrive\Desktop\ZALAMATI\launch_zalamati.ps1"
   ```
3. Name it "ZALAMATI - Fast Learning"
4. Right-click shortcut → Properties
5. Change icon to `zalamati_icon.ico`
6. Set "Run" to "Minimized" if you prefer

### Method 3: Batch File Wrapper (Most Compatible)
Create a file called `ZALAMATI_Launcher.bat` with this content:
```batch
@echo off
cd /d "C:\Users\shadi\OneDrive\Desktop\ZALAMATI"
powershell.exe -ExecutionPolicy Bypass -File "launch_zalamati.ps1"
pause
```

Then create a shortcut to this .bat file.

## Icon Setup
- Place the `zalamati_icon.ico` file in the ZALAMATI folder
- In shortcut Properties → Change Icon → Browse to select the .ico file
- Click OK to apply

## Notes
- The PowerShell script may ask for execution policy permission the first time
- Both backend and frontend will open in separate command windows
- Close those windows to stop the application
- The shortcut will work from anywhere on your system

## Troubleshooting
- If PowerShell scripts don't run, open PowerShell as Administrator and run:
  ```powershell
  Set-ExecutionPolicy RemoteSigned
  ```
- Make sure Python and Node.js are installed and in your system PATH
