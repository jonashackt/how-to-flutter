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

[On a mac we can install Flutter](https://docs.flutter.dev/get-started/install/macos) using brew:

```
brew install flutter
```

You can grab yourself a coffee now - this may take a while (2.8 gigs).