# How to install flutter on macOS?

Follow the instructions. For my case I run the following commands

```shell
cd ~/Applications
git clone https://github.com/flutter/flutter.git -b stable

# Make sure the path is exported
# export PATH=~/Applications/flutter/bin:$PATH
flutter doctor

# Switch to beta channel to enable web
flutter channel beta
flutter upgrade
flutter config --enable-web

# Check available devices
flutter devices

# Start an application
flutter create my_dummy_app_flutter
flutter run
flutter run -d chrome
```

# How to fix the installation?

When running `flutter doctor` the first time there was various errors.

* Accept the license by running
  `flutter doctor --android-licenses`
* It was failing because the `sdkmanager` was not found. To fix that, install the obsolete "SDK" in Android Studio.
  https://github.com/flutter/flutter/issues/51670

