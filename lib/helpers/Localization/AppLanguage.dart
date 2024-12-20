import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'MyLang/CashData.dart';

class AppLanguage extends GetxController {
  String appLocal = 'ar';  // Make appLocal observable

  @override
  void onInit() async {
    super.onInit();
    CashData cash = CashData();
    // Load saved language or default to 'ar'
    appLocal = await cash.selectedLanguage ?? 'ar';
    Get.updateLocale(Locale(appLocal));  // Set locale immediately
  }

  // Method to change language
  void changeLanguage(String type) async {
    CashData cash = CashData();

    if (appLocal == type) {
      return;
    }

    appLocal = type;
    await cash.saveLanguageState(type); // Save selected language
    Get.updateLocale(Locale(type)); // Update locale immediately
  }
}
