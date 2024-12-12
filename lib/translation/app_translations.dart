import 'package:get/get.dart';

import 'hi_NG/hi_ng_translation.dart';
import 'us_EN/en_us.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enUs,
        'hi': hiIn,
      };
}
