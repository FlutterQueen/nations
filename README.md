# Package rules

1 - do not load all the files only load the selected language
2 - if no preferred language set current locale to device locale if the device locale is not supported use the `fallbackLocale`
3 - after that every time the app opens use the save current locale
4 - files structure

```yaml
assets:
  - lang:
      - ar.json
      - en.json
```

5- support_country

with the same structure no change required

```yaml
assets:
  - lang:
      - ar.json
      - ar_EG.json
      - ar_SA.json
      - en.json
```

6 - args => {
"some_key":"hi name ,, welcome back"
}
'some_key'.trArgs(Map : 'name','ahmed')

7 - namedArgs

8 - gender

9 - plurals

10 - linked translations

11 - runner with lighthouse

    - [ ] generator
    - shrinker
    - analyzer
    - tests

12 - logs => with flavors

```json
{
  "wellcome": "اهلا بك يا",
  "last_login": "اخر تسجيل دخول منذ",
  //   "wellcome_message": "اهلا بك يا :name اخر تسجيل دخول منذ"
  "wellcome_message": "@wellcome :name @wellcome_message"
}
```
