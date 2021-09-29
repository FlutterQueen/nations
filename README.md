## **Nations 🌍**

# Before using ! ⚠

# Why another localization package ?

Other packages is doing very will including reach feature to make life easier ,, but for single projects only , doing the same localization system in many packages at the same time is a different problem i will try to solve !

# why make it like this ?

- this will make packages takes control of the localization which will spare the developer of this responsibility
- like when using a validation package for example the failure message should be automatically localized out of the box !
- would this package prevent the developer to use custom translated messages ? No ,, it will only provide a default values in many languages out of the box !
- would this increase the app size ? No , this will provide the necessary values only

# Conclusion

## There are 3 ways

1 - if you just want to localize your app and handle every thing by your self you should go with the the flutter way from the documentation

2 - need more features out of the box and you will be responsible for localizing your features and services ? use `easy_localization` or `getx` or any other package solving the same problem

3 - need more localization problems fixed out of the box ? this package will do it

# more

# **`So if you you are good with the first or the second way stop reading you won't need this package`**

# Features

## every feature provided by any other standard localization package

## and more

### nations assets

this package contains translated message to use out of the box , no need to add them any more
example

```dart
final message = 'login'.tr
print(message);
```

also you did't add `login` message in your assets and translate it to the your supported languages
it will use the nation assets and gets you the correct translated message
if the `MaterialApp` `locale` is arabic it will be `تسجيل الدخول` and if the locale is `English` it will be `Sign In` any so on out of the box

### does this means i can't override the `login` keyword ?

no the package will use the default values only if you don't have one in you assets so you can override it any time

### does this package have a big data sets ? - Will This Make The App very big ?

no this package will contains the necessary and the common keywords sings use in Authentication , Validation , searching , Filtering , introductions , ...etc and will be added manually to choses carefully
which means you gonna support more languages out of the box in the entire app

### Still needs more ?

- testing utilities
- logs
- public api for package owners to localize there packages out of the box with nation package
