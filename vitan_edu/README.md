
# super app

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
flutter pub run flutter_native_splash:create
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run flutter_launcher_icons:main
BnD.CE.MobileApp
flutter run --release

pod deintegrate
pod cache clean --all
pod install

'http://117.4.243.193:8085/api/exam/v1/Exam/InintESAll?isCreate=false' \

- [Flavor]
flutter run -t lib/main.dart --flavor dev

flutter run -t lib/main_prod.dart --flavor prod


#Run app in `dev` environment
flutter run -t lib/main_dev.dart  --flavor=dev
# Run app in debug mode (Picks up debug signing config)
flutter run -t lib/main_dev.dart  --debug --flavor=dev
# Run app in release mode (Picks up release signing config)
flutter run -t lib/main_dev.dart  --release --flavor=dev
# Create appBundle for Android platform. Runs in release mode by default.
flutter build appbundle -t lib/main_dev.dart  --flavor=dev
# Create APK for dev flavor. Runs in release mode by default.
flutter build apk -t lib/main_dev.dart  --flavor=dev