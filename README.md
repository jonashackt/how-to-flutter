# how-to-flutter
[![License](http://img.shields.io/:license-mit-blue.svg)](https://github.com/jonashackt/how-to-flutter/blob/master/LICENSE)
[![renovateenabled](https://img.shields.io/badge/renovate-enabled-yellow)](https://renovatebot.com)

A backend engineer looking into cross-plattform mobile development


## My goal: get into both App Stores as quickly as possible

As a "DevOps / backend focussed engineer" I finally wanted to have a look into app development.

For me it was crucial to get a head start without much friction. My goal was to get a running app out into both the Android and Apple AppStores as quickly as possible.

So I opted for cross-platform development frameworks and read some current "popular frameworks in this space" articles like https://hackernoon.com/9-popular-cross-platform-tools-for-app-development-in-2019-53765004761b

Soon I realized both React Native and Flutter are the top dogs today, so I read more about them https://hackr.io/blog/react-native-vs-flutter

Eating my own dogfood I asked myself: what are my requirements? The "when to use Flutter section" got me:

```
When to Use Flutter

    Small budgets
    Short development timeline
    UI-centered apps
    Iteration (Hot Reload)
```

`small budgets` and `short development timeline` both sound like the thing I was looking for to "get into both App Stores as quickly as possible".


## Flutter & Dart

https://flutter.dev is based on Google's https://dart.dev programming language, which is focussed to be a `a client-optimized language for fast apps on any platform` - sounds good, although I need to learn a new language.

Dart is compiled to ARM & x64 machine code for mobile, desktop, and backend. Or compile to JavaScript for the web. It also uses AOT-compilation for performance and should be much faster then React Native, since there's no separate thread using JavaScript anymore. Everything is compiled to native!

Sounds really nice, so let's get our hands dirty: https://flutter.dev/learn


## Prepare your dev environment for Flutter

### Install Dart SDK

This is mainly to have a Dart SDK available in IntelliJ (which we might also have using only flutter installation, but will check that later):

https://dart.dev/get-dart

```shell
brew tap dart-lang/dart
brew install dart
```

### Install Flutter SDK

https://docs.flutter.dev/get-started/install/macos

On a mac we can install Flutter using brew:

```shell
brew install flutter
```

You can grab yourself a coffee now - this may take a while (2.8 gigs).

When this finished, you should run 

```shell
flutter doctor
```

This should show you, what is missing on your machine!


### iOS simulator

Using the iOS simulator no device is required.

https://docs.flutter.dev/get-started/install/macos#set-up-the-ios-simulator

Open it via

```
open -a Simulator
```

![iphone-simulator](screenshots/iphone-simulator.png)



### iOS setup

These steps are required if you want to use your iPhone device itself to testdrive your Flutter app.

https://docs.flutter.dev/get-started/install/macos

> To deploy your Flutter app to a physical iOS device you’ll need to set up physical device deployment in Xcode and an Apple Developer account. If your app is using Flutter plugins, you will also need the third-party CocoaPods dependency manager.

#### Update MacOS, XCode & CommandLineTools

First be sure to have your latest MacOS installed:

```shell
softwareupdate --all --install --force
```

https://docs.flutter.dev/get-started/install/macos#install-xcode

For iOS development we need XCode to be installed (e.g. via the Mac App Store).


#### CocoaPods

```shell
sudo gem install cocoapods
```

If that does fail with `The compiler failed to generate an executable file. (RuntimeError) You have to install development tools first.`, you need to run (see https://stackoverflow.com/a/57217502/4964553)

```
xcode-select --install
```



### Android setup

https://docs.flutter.dev/get-started/install/macos#android-setup

Install Android Studio (do not use `brew install android-sdk`, since it has been officially discontinued upstream)

```
brew install android-studio
```



## Start with Flutter

Now let's dive into building our first app.

https://codelabs.developers.google.com/codelabs/first-flutter-app-pt1/#0

Create a Flutter app template with

```shell
flutter create how_to_flutter
```

This will create a new folder `how_to_flutter`, which contents I then integrated into my root directory.

Paste the `hello world` example code into [lib/main.dart](lib/main.dart):

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
```

Be sure that the iOS simulator is running (`open -a Simulator` if not) and then run

```shell
flutter run
```

Now your app should run inside the simulator:

![frist-hello-world-app-run-simulator](screenshots/frist-hello-world-app-run-simulator.png)