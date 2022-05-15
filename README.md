# Parpera Demo

### First thing first. Download the specific version for Flutter.

Current Flutter Version:
                    ```Flutter 2.10.5 • channel stable •
                            Framework • revision 5464c5bac7 (4 weeks ago) • 2022-04-18 09:55:37 -0700
                            Engine • revision 57d3bac3dd
                            Tools • Dart 2.16.2 • DevTools 2.9.2
                    ```

[Download URL for Windows](https://docs.flutter.dev/development/tools/sdk/releases?tab=windows)

[Download URL for MacOS](https://docs.flutter.dev/development/tools/sdk/releases?tab=macos)

### Second, [follow the instruction of setting up Flutter](https://docs.flutter.dev/get-started/install)

After finishing set up environmental valuable of Flutter, run command:
```flutter doctor```
to make sure Flutter has been set up successfully.

### Then you need to have Android Studio or Visual Studio Code (Android Studio Preferred)

Current Android Studio Version:
                                    ```Android Studio 4.2.2
                                    Build #AI-202.7660.26.42.7486908, built on June 24, 2021
                                    Runtime version: 11.0.8+10-b944.6842174 amd64
                                    ```
Add the following dependencies  in Android Studio:

```
flutter_bloc: ^8.0.1 --> allow to use bloc structure for the project
equatable: ^2.0.3 --> used to compare object
http: ^0.13.4 --> for http requesting and posting purpose

```

Add the following plugins in Android Studio:

```
Flutter --> which will automatically add Dart SDK
Bloc --> Automatically Bloc structure
Clean Architecture --> Automatically generate folders for clean architecture

```

### Make sure you run the app after running these command:

```
flutter packages pub get
```

The project contains three layers.

UI Layer (lib/screens):

    This layer comprises of the screens/pages for UI.

Domain Layer (lib/domain):

    This layer comprises of Abstract methods for business logic


Data Layer (lib/data):

    This layer is the concrete implementation of Domain Layer.

