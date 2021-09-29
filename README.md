## **Nations 🌍**

# Features

- translation without context 🚀
- load translations from json , yaml , dart , even api or any data source 😎
- pluralization 💪
- gender 🚹🚺
- auto RTL - LTR based on the current locale
- nested translation 'validation.too_short' 🕸
- reloading the app automatically 🔄
- detecting a duplicate or a missing message 🔍🆕
- code generation `TR.signIn` and you will get the translated message directly 🆕
- easily integrated with other packages to save more time and provided locaization out of the box base on your app configuration 🔥
- easy to override the messages 🔱
- support all platforms ✔
- support null-safety ✔
- automatically save the last preferred language 🚀 - no shared prefs 🔥🔥 -

# nations assets

this package contains translated message to use out of the box , no need to add them any more
example

```dart
final message = 'login'.tr
print(message);
```

also you did't add `login` message in your assets and translate it to the your supported languages
it will use the nation assets and gets you the correct translated message
if the `MaterialApp` `locale` is arabic it will be `تسجيل الدخول` and if the locale is `English` it will be `Sign In` any so on out of the box

# does this means i can't override the `login` keyword ?

no the package will use the default values only if you don't have one in you assets so you can override it any time

# does this package have a big data sets ? - Will This Make The App very big ?

no this package will contains the necessary and the common keywords sings use in Authentication , Validation , searching , Filtering , introductions , ...etc and will be added manually to choses carefully
which means you gonna support more languages out of the box in the entire app

# Still needs more ?

- testing utilities
- logs
- public api for package owners to localize there packages out of the box with nation package

# Example with `queen_validators`

![example](https://github.com/maxzod/nations/blob/master/images/example_with_queen_validators.png)

# why make it like this ?

- this will make packages takes control of the localization which will spare the developer of this responsibility
- like when using a validation package for example the failure message should be automatically localized out of the box !
- would this package prevent the developer to use custom translated messages ? No ,, it will only provide a default values in many languages out of the box !
- would this increase the app size ? No , this will provide the necessary values only

# Usage

we are still in beta stage star and wait for further releases
