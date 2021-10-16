## **`Nations 🌍`**

[![test](https://github.com/maxzod/nations/actions/workflows/dart.yml/badge.svg)](https://github.com/maxzod/nations/actions/workflows/dart.yml)

# Step Three

- [ ] Arabic Docs
- [ ] logs base on the flavor
- [ ] productivity - avoiding bugs
  - [ ] VsCode extension
    - [ ] Go to source
    - [ ] See the Translated keyword
    - [ ] add keyword to translations
  - [ ] CLI - Lighthouse 💡
    - [x] `lh make:locale` generate api for translation files
    - [ ] `lh locale:fix` show bugs in the localization (same schema , duplicates , missing , same as the nation assets) 🔍🆕
    - [ ] `lh locale:list` show supported locales list
    - [ ] `lh tr:shrink` shrinking assets by removing useless spaces before building
    - [ ] code generation `Tr.key` and you will get the translated message directly 🆕
      - [x] show gender API
      - [ ] show attributes API
      - [ ] show plural API
      - [x] show nested API

# Step Two

- [ ] make sure tests cover every thing

# Step One (done) ✔

- [x] translation without context 🚀
- [x] custom configuration
  - [x] value not found builder
  - [x] fallback locale
  - [x] supported locales
  - [x] fall back to base before loading the fallback
- [x] Translation files Loaders
  - [x] json
  - [x] dart
  - [x] even Api or any data source 😎
- [x] Translation
  - [x] Pluralization 💪
    - [x] single count
    - [x] range
    - [x] to infinity
    - [x] more the one number
  - [x] Attributes
  - [x] Nested translation 'validation.too_short' 🕸
  - [x] Gender
    - [x] Male
    - [x] Female
    - [x] Gender default `set the gender once then it will be used every were else`
- [x] App
  - [x] auto RTL - LTR based on the current locale
  - [x] reloading the app automatically 🔄
  - [x] automatically save the last preferred language in the shared preferences 🚀
- [x] public API
  - [x] easily integrated with other packages to save more time and provided locaization out of the box base on your app configuration 🔥
- [x] customization
  - [x] easy to override the messages 🔱
  - [x] capitalize first character in the first word
  - [x] capitalize first character in each word
- [x] other
  - [x] support All Platforms ✔
  - [x] support Null-Safety ✔

# Nations Assets

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

![example](https://github.com/maxzod/nations/blob/testing/images/example_with_queen_validators.png)

# why make it like this ?

- this will make packages takes control of the localization which will spare the developer of this responsibility
- like when using a validation package for example the failure message should be automatically localized out of the box !
- would this package prevent the developer to use custom translated messages ? No ,, it will only provide a default values in many languages out of the box !
- would this increase the app size ? No , this will provide the necessary values only

# Usage

we are still in beta stage star and wait for further releases

# Decorations

## attributes

which allows to customize the translated message

Example in validation :
Arabic => "الحد الاقصي للحروف 255"
English => "max length is 255"

255 is the max length and might changes some times is 255 or 55 or just 2 depend on the form
how to achieve that in nations ?

```json
"max_length_is":"max length is :count"
```

and in your code

```dart
final msg = 'max_length_is'.args({"count":255});
```

for now the generations is not done yet after we finish them no
more String keys and dynamic parameters every thing will be hard type and stricter to avoid future bugs

# Helpers

- [x] `capitalizeFirstChar(String)` to make the first word capital
- [x] `capitalizeEachWord` to make every word capital in one line more entire paragraph
- [ ] `numberToLocale(String,[Locale?])` localize numbers based on locale
