# Google Hackathon Project - Setup Guide

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Installation Steps](#installation-steps)
3. [Environment Variables Setup](#environment-variables-setup)
4. [Running the Application](#running-the-application)
5. [Project Structure](#project-structure)
6. [Troubleshooting](#troubleshooting)

---

## Prerequisites

Before setting up this project, ensure you have the following installed on your system:

### Required Software

1. **Flutter SDK** (Version 3.0.0 or higher)
   - Download from: https://docs.flutter.dev/get-started/install/windows
   - Direct link: https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.24.5-stable.zip
   - Size: ~1.5 GB

2. **Android Studio** (For Android development)
   - Download from: https://developer.android.com/studio
   - Size: ~1 GB
   - Includes: Android SDK, Android Emulator

3. **Git**
   - Download from: https://git-scm.com/download/win
   - Size: ~50 MB

4. **Python** (Version 3.8 or higher) - For server component
   - Download from: https://www.python.org/downloads/
   - Direct link: https://www.python.org/ftp/python/3.12.1/python-3.12.1-amd64.exe
   - Size: ~25 MB

5. **Visual Studio Code** (Recommended IDE)
   - Download from: https://code.visualstudio.com/download
   - Size: ~100 MB
   - Required Extensions: Flutter, Dart

### System Requirements

- **OS:** Windows 10 or later (64-bit)
- **RAM:** 8 GB minimum (16 GB recommended)
- **Disk Space:** 15 GB free space minimum
- **Processor:** Intel i5 or equivalent

---

## Installation Steps

### Step 1: Install Git

1. Download Git from: https://git-scm.com/download/win
2. Run the installer (`Git-2.43.0-64-bit.exe`)
3. Use default settings throughout installation
4. Click "Install" and wait for completion

**Verify Installation:**
```bash
git --version
```
Expected output: `git version 2.43.0.windows.1` (or similar)

---

### Step 2: Install Flutter SDK

#### 2.1 Download and Extract Flutter

1. Download Flutter SDK from: https://docs.flutter.dev/get-started/install/windows
2. Create a folder: `C:\src` (if it doesn't exist)
3. Extract the downloaded zip file to `C:\src\flutter`
4. Final path should be: `C:\src\flutter\bin\flutter.bat`

#### 2.2 Add Flutter to System PATH

1. Press `Windows + R`, type `sysdm.cpl`, press Enter
2. Go to "Advanced" tab → Click "Environment Variables"
3. Under "User variables", find and select "Path"
4. Click "Edit" → Click "New"
5. Add: `C:\src\flutter\bin`
6. Click "OK" on all dialogs

#### 2.3 Verify Flutter Installation

**Important:** Close any open Command Prompt windows and open a NEW one

```bash
flutter --version
```

Expected output:
```
Flutter 3.24.5 • channel stable
Framework • revision abc123...
Engine • revision xyz789...
Tools • Dart 3.5.4 • DevTools 2.37.3
```

#### 2.4 Run Flutter Doctor

```bash
flutter doctor
```

This command checks your environment and displays a report. Don't worry if some items show warnings - we'll fix them in the next steps.

---

### Step 3: Install Android Studio

#### 3.1 Download and Install

1. Download from: https://developer.android.com/studio
2. Run the installer
3. Choose "Standard" installation type
4. Wait for Android SDK components to download (this takes 10-15 minutes)
5. Click "Finish" when done

#### 3.2 Install Android SDK Components

1. Open Android Studio
2. Click on "More Actions" → "SDK Manager" (or go to: File → Settings → Appearance & Behavior → System Settings → Android SDK)
3. In "SDK Platforms" tab:
   - ☑️ Check "Android 13.0 (Tiramisu)" or latest version (API Level 33+)
4. In "SDK Tools" tab, check:
   - ☑️ Android SDK Build-Tools
   - ☑️ Android SDK Command-line Tools
   - ☑️ Android Emulator
   - ☑️ Android SDK Platform-Tools
5. Click "Apply" → "OK"
6. Wait for downloads to complete

#### 3.3 Accept Android Licenses

Open Command Prompt and run:
```bash
flutter doctor --android-licenses
```

Type `y` and press Enter for each license agreement.

#### 3.4 Create Android Emulator (Virtual Device)

1. In Android Studio, click "More Actions" → "Virtual Device Manager"
2. Click "Create Device"
3. Select "Phone" → "Pixel 5" (or any device)
4. Click "Next"
5. Download a system image (API Level 33 recommended - "Tiramisu")
6. Click "Next" → "Finish"

---

### Step 4: Install Visual Studio Code (Optional but Recommended)

1. Download from: https://code.visualstudio.com/download
2. Run the installer
3. Check "Add to PATH" during installation
4. Open VS Code after installation

#### 4.1 Install Flutter Extensions

1. Open VS Code
2. Press `Ctrl+Shift+X` (Extensions panel)
3. Search for "Flutter" → Click "Install"
4. Search for "Dart" → Click "Install"
5. Restart VS Code

---

### Step 5: Install Python

1. Download Python from: https://www.python.org/downloads/
2. Run the installer
3. ⚠️ **IMPORTANT:** Check "Add Python to PATH" checkbox at the bottom
4. Click "Install Now"
5. Wait for installation to complete

**Verify Installation:**
```bash
python --version
```

Expected output: `Python 3.12.1` (or similar)

Also verify pip (Python package manager):
```bash
pip --version
```

---

### Step 6: Setup Project

#### 6.1 Extract Project Files

1. Extract the project zip file
2. Navigate to the extracted folder:
```bash
cd "D:\Google Hackathon - Copy"
```

#### 6.2 Install Flutter Dependencies

```bash
flutter pub get
```

This will download all required Flutter packages listed in `pubspec.yaml`.

#### 6.3 Install Python Dependencies (If requirements.txt exists)

```bash
# Check if requirements.txt exists
dir requirements.txt

# If it exists, install dependencies
pip install -r requirements.txt
```

Common Python packages that might be needed:
```bash
pip install flask
pip install requests
pip install python-dotenv
```

#### 6.4 Verify Setup

```bash
flutter doctor -v
```

Check that all green checkmarks appear for:
- ✅ Flutter
- ✅ Android toolchain
- ✅ VS Code (if installed)

---

## Environment Variables Setup

### What are Environment Variables?

Environment variables store configuration values that your application needs to run, such as API keys, database URLs, and server ports. They keep sensitive information separate from your code.

### Understanding PATH

The PATH environment variable tells Windows where to find executable programs. When you type a command like `flutter` or `python`, Windows searches all directories listed in PATH to find these programs.

### How to View Environment Variables

1. Press `Windows + R`
2. Type `sysdm.cpl` and press Enter
3. Go to "Advanced" tab
4. Click "Environment Variables"

You'll see two sections:
- **User variables:** Apply only to your user account
- **System variables:** Apply to all users on the computer

### Verifying Your Setup

After installation, these should be in your PATH:

**Check Flutter:**
```bash
where flutter
```
Expected: `C:\src\flutter\bin\flutter.bat`

**Check Python:**
```bash
where python
```
Expected: `C:\Users\YourName\AppData\Local\Programs\Python\Python312\python.exe`

**Check Git:**
```bash
where git
```
Expected: `C:\Program Files\Git\cmd\git.exe`

### Firebase Configuration (Already Done)

⚠️ **Important:** This project uses an existing Firebase project. All configuration is pre-configured:
- ✅ `firebase.json` - Firebase project settings
- ✅ `.firebaserc` - Project reference
- ✅ `android/app/google-services.json` - Android configuration

**You do NOT need to:**
- Create a Firebase account
- Install Firebase CLI
- Set up a new Firebase project
- Configure Firebase manually

Everything is ready to use!

---

## Running the Application

### Step 1: Start Android Emulator

#### Option A: Using Android Studio
1. Open Android Studio
2. Click "More Actions" → "Virtual Device Manager"
3. Click the ▶️ (Play) button next to your virtual device
4. Wait for the emulator to fully boot (2-3 minutes)

#### Option B: Using Command Line
```bash
# List available emulators
emulator -list-avds

# Start a specific emulator
emulator -avd Pixel_5_API_33
```

#### Option C: Use Physical Android Device
1. Enable "Developer Options" on your phone:
   - Go to Settings → About Phone
   - Tap "Build Number" 7 times
2. Enable "USB Debugging":
   - Go to Settings → Developer Options
   - Enable "USB Debugging"
3. Connect phone via USB cable
4. Verify connection:
```bash
flutter devices
```

### Step 2: Verify Device is Connected

```bash
flutter devices
```

Expected output:
```
2 connected devices:

sdk gphone64 arm64 (mobile) • emulator-5554 • android-arm64  • Android 13 (API 33)
Chrome (web)                • chrome        • web-javascript • Google Chrome 120.0
```

### Step 3: Run the Flutter Application

#### Navigate to Project Directory
```bash
cd "D:\Google Hackathon - Copy"
```

#### Run the App
```bash
flutter run
```

**What happens:**
- Flutter compiles your app
- Installs it on the emulator/device
- Launches the app
- Shows console logs

**Expected Output:**
```
Launching lib\main.dart on sdk gphone64 arm64 in debug mode...
Running Gradle task 'assembleDebug'...
✓ Built build\app\outputs\flutter-apk\app-debug.apk.
Installing build\app\outputs\flutter-apk\app.apk...
Syncing files to device sdk gphone64 arm64...

Flutter run key commands.
r Hot reload.
R Hot restart.
h List all available interactive commands.
d Detach (terminate "flutter run" but leave application running).
c Clear the screen
q Quit (terminate the application on the device).

An Observatory debugger and profiler on sdk gphone64 arm64 is available at: http://127.0.0.1:xxxxx/
The Flutter DevTools debugger and profiler on sdk gphone64 arm64 is available at: http://127.0.0.1:xxxxx/
```

#### Using Hot Reload (During Development)

While the app is running:
- Press `r` → Hot reload (updates UI instantly)
- Press `R` → Hot restart (restarts the app)
- Press `q` → Quit application

---

### Step 4: Run Python Server (If Applicable)

If your project includes a Python backend server, start it:

```bash
python run.py
```

⚠️ **Important:** Keep this Command Prompt window open while using the app.

---

### Step 5: Using the Application

Once both Flutter app and Python server (if needed) are running:

1. The app should appear on your emulator/device
2. Interact with the app normally
3. Check console logs for any errors

---

## Project Structure

```
GOOGLE-HACKATHON-COPY/
├── android/              # Android platform files
│   └── app/
│       └── google-services.json  # Firebase config (included)
├── app/                  # App-specific code
├── assets/               # Images, fonts, and other assets
├── functions/            # Firebase Cloud Functions (if any)
├── lib/                  # Main Dart source code
│   ├── main.dart        # App entry point
│   ├── models/          # Data models
│   ├── screens/         # UI screens
│   ├── services/        # Business logic & API calls
│   └── widgets/         # Reusable widgets
├── server/               # Backend server code (Python)
├── test/                 # Unit and widget tests
├── web/                  # Web platform files
├── .firebaserc          # Firebase project reference (included)
├── .gitignore           # Git ignore rules
├── firebase.json        # Firebase configuration (included)
├── pubspec.yaml         # Flutter dependencies
├── run.py               # Python server startup script
└── README.md            # This file
```

---

## Troubleshooting

### Common Issues and Solutions

#### 1. "flutter: command not found" or "not recognized"

**Cause:** Flutter not in PATH or Command Prompt not restarted

**Solution:**
```bash
# Close Command Prompt completely
# Open NEW Command Prompt
flutter --version

# If still not working, verify PATH:
echo %PATH%
# Should contain: C:\src\flutter\bin
```

#### 2. "Unable to locate Android SDK"

**Solution:**
```bash
# Set ANDROID_HOME environment variable
# 1. Press Windows + R, type: sysdm.cpl
# 2. Advanced → Environment Variables
# 3. New System Variable:
#    Variable name: ANDROID_HOME
#    Variable value: C:\Users\YourName\AppData\Local\Android\Sdk
# 4. Click OK, restart Command Prompt

# Verify:
flutter doctor -v
```

#### 3. "Android licenses not accepted"

**Solution:**
```bash
flutter doctor --android-licenses
# Type 'y' for all licenses
```

#### 4. "No devices found"

**Solution:**
```bash
# Start emulator from Android Studio
# OR
# List available emulators
emulator -list-avds

# Start one
emulator -avd Pixel_5_API_33

# Wait 2-3 minutes, then check:
flutter devices
```

#### 5. Gradle build fails

**Solution:**
```bash
# Clean build
flutter clean

# Get dependencies again
flutter pub get

# Try running again
flutter run
```

#### 6. "Python is not recognized"

**Cause:** Python not in PATH

**Solution:**
1. Uninstall Python
2. Reinstall and **CHECK "Add Python to PATH"**
3. Restart Command Prompt
4. Verify: `python --version`

#### 7. Python server won't start

```bash
# If requirements.txt exists, install dependencies:
pip install -r requirements.txt

# Then run:
python run.py
```

#### 8. App crashes on startup

**Check logs:**
```bash
# Run with verbose logging
flutter run -v

# Check for errors in output
```

**Common causes:**
- Missing dependencies: Run `flutter pub get`
- Firebase misconfiguration: Verify files exist
- Server not running: Start Python server with `python run.py`

---

## Additional Commands Reference

### Flutter Commands

```bash
# Check Flutter and project status
flutter doctor -v

# Clean build files
flutter clean

# Get dependencies
flutter pub get

# Update dependencies
flutter pub upgrade

# List connected devices
flutter devices

# Run app on specific device
flutter run -d emulator-5554

# Build APK for release
flutter build apk --release

# Build App Bundle
flutter build appbundle --release

# Run tests
flutter test

# Analyze code for issues
flutter analyze

# Format code
flutter format .
```

### Python Commands

```bash
# Check Python version
python --version

# Check pip version
pip --version

# Install package
pip install package_name

# Install from requirements.txt
pip install -r requirements.txt

# List installed packages
pip list

# Run Python script
python run.py
```

---

## Building for Release

### Create Release APK

```bash
# Build release APK
flutter build apk --release

# APK location:
# build/app/outputs/flutter-apk/app-release.apk
```

### Install on Device

```bash
# Install the APK directly
flutter install

# Or manually install
adb install build/app/outputs/flutter-apk/app-release.apk
```

---

## Important Notes

### For Students/Developers:

1. **Firebase is Pre-Configured**
   - All Firebase files are included
   - Do NOT create a new Firebase project
   - Do NOT modify Firebase configuration files

2. **Keep Server Running**
   - If using Python server, keep it running while testing the app
   - Server logs help debug issues

3. **Development Best Practices**
   - Use hot reload (`r`) instead of restarting
   - Check console logs for errors
   - Test on both emulator and real device

### For Faculty/Reviewers:

1. **Quick Start:**
   - Install Flutter, Android Studio, Python
   - Run `flutter pub get`
   - Start emulator
   - Run `flutter run`
   - Start Python server (if applicable)

2. **All dependencies are listed in:**
   - Flutter: `pubspec.yaml`
   - Python: `requirements.txt` (if exists)

3. **Firebase is ready to use:**
   - No account creation needed
   - No CLI installation needed
   - Configuration files included

4. **For issues:**
   - Check Troubleshooting section
   - Review console logs
   - Verify all prerequisites are installed

---

## Testing Checklist

Before submission, verify:

- [ ] Flutter app runs without errors
- [ ] Python server starts successfully (if applicable)
- [ ] All features work as expected
- [ ] No sensitive data (API keys) in code
- [ ] `flutter analyze` shows no critical issues
- [ ] Tested on Android emulator
- [ ] Tested on real device (if possible)
- [ ] README is up to date

---

## Support Resources

- **Flutter Documentation:** https://flutter.dev/docs
- **Flutter Cookbook:** https://docs.flutter.dev/cookbook
- **Dart Language:** https://dart.dev/guides
- **Firebase Documentation:** https://firebase.google.com/docs
- **Python Documentation:** https://docs.python.org/3/
- **Stack Overflow:** https://stackoverflow.com/questions/tagged/flutter

---

## Contact

For questions or issues:
- Contact project team: [Your email]
- Check project repository: [Your repo link if any]

---

**Last Updated:** December 2025
**Project:** Google Hackathon Submission