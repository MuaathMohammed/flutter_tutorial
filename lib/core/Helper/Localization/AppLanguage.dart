import 'dart:ui';

import 'package:get/get.dart';

import 'MyLang/CashData.dart';

class AppLanguage extends GetxController{
String? appLocal='ar';
@override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    CashData cash= new CashData();
    appLocal= await cash.selectedLanguage==null?'ar':await cash.selectedLanguage;
    Get.updateLocale(Locale(appLocal!));
    update();
  }
  void changeLanguage(type)async{
    CashData cash= new CashData();

    if(appLocal==type)
      {
        return;
      }
    if(type=='ar'){
      appLocal='ar';
      cash.saveLanguageState('ar');
    }
    else{
      appLocal='en';
      cash.saveLanguageState('en');
    }
    update();
  }
}