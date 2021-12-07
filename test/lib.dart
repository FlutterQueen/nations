import 'dart:async';
import 'dart:ui';

import 'package:nations/nations.dart';

class NationsTestLoader extends NationsLoader {
  NationsTestLoader([String name = 'test', this.data]) : super(name);

  final Map<String, Object>? data;

  @override
  FutureOr<Map<String, Object?>> load(Locale locale) {
    return data ??
        {
          "gender": {"this": "الجنس", "male": "ذكر", "female": "انثي"},
          'test_k': 'test_v',
          'args_key': "اهلا بك يا :name",
          "person": {"male": "سيدي", "female": "سيدتي"},
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
            "2": "تفاحتين",
            "10": "عشرة تفاحات",
            "15,14,18": ":count تفاحه",
            "60-70": "من ستون الي سبعون"
          }
        };
  }
}
