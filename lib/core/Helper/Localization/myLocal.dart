import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MyLang/ArLang.dart';
import 'MyLang/EnLang.dart';

class translate extends Translations{

  @override
  Map<String, Map<String, String>> get keys=> {
    'en':en,
    'ar':ar
  };
  static final  locale = Locale('ar','ar');
 // static final  locale = _getLocaleFromLanguage();

  static final fallbackLocale = Locale('en', 'en');

  static final langCodes = [
    'en',
    'ar',
  ];

  static final locales = [
    Locale('en', 'en'),
    Locale('ar', 'ar'),
  ];


  static final langs = LinkedHashMap.from({
    'en': 'English',
    'ar': 'Arabic',
  });

  static void changeLocale(String langCode) async{
    final locale =await _getLocaleFromLanguage(langCode: langCode);
    Get.updateLocale(locale!);
  }

  // @override
  // Map<String, Map<String, String>> get keys => {
  //   'en_EN': en,
  //   'vi_ER': ar,
  // };

  static Locale? _getLocaleFromLanguage({String? langCode})  {

    var lang = langCode ?? Get.deviceLocale?.languageCode;
    for (int i = 0; i < langCodes.length; i++) {
      if (lang == langCodes[i]) return locales[i];
      SharedPreferences.getInstance().then((res) {
         res.setString("lang",lang!) as String?;
      });
    }
       return Get.locale;
  }
}