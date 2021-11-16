import 'package:flutter/material.dart';
import 'package:nations/nations.dart';

/// this loader is meant for test purposes only
/// since we cant load assets with the rootBundle from the tests
class TestFilesLoader extends NationsLoader {
  @override
  Map<String, dynamic> load(Locale locale) {
    switch (locale.languageCode) {
      case 'ar':
        return {
          "package_name": "أمم",
          "args_key": "اهلا بك يا :name",
          "date": "التاريخ",
          "time": "الوقت",
          "enter": "دخول",
          "edit": "تعديل",
          "show": "عرض",
          "delete": "حذف",
          "error": "خطا",
          "internet": "انترنت",
          "no": "لا",
          "yes": "نعم",
          "confirm": "تاكيد",
          "gender": {"male": "ذكر", "female": "انثي"},
          "validation": {
            "required": "هذا الحقل مطلوب",
            "email": "البريد الالكتروني غير صحيح",
            "age": {
              "to_young": "صغير جدا",
              "old_enough": "كبير بما فيه الكفاية",
              "very_old": "كبير جدا"
            }
          },
          "apples": {
            "1": "تفاحه واحده",
            "5": "خمسه تفاحات",
            "2": "اثنان تفاحات",
            "10": "عشرة تفاحات",
            "15,14": " تفاحات :count",
            "60-70": "اكثر من ستون الي سبعون تفاحة"
          }
        };
      case 'en':
        return {
          "package_name": "nations",
          "date": "date",
          "time": "time",
          "enter": "enter",
          "edit": "edit",
          "show": "show",
          "delete": "delete",
          "error": "error",
          "internet": "internet",
          "no": "no",
          "yes": "yes",
          "confirm": "confirm",
          "gender": {"male": "Male", "female": "Female"},
          "validation": {
            "required": "this input is required",
            "email": "wrong email address",
            "password": "validation  inner password",
            "age": {
              "to_young": "too young 👶",
              "old_enough": "old enough ✔",
              "very_old": "very old 💪"
            }
          }
        };

      default:
        return {};
    }
  }
}
