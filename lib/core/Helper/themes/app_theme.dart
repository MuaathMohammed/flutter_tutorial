import 'package:flutter/material.dart';
import 'package:my_shop_app/app/core/Helper/AppConstant/AppColorConstant.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

class AppTheme {
  static ThemeData light = lightTheme(
      bkColor: AppColor.white,
      sfBkColor: AppColor.white,
      appBrColor: AppColor.primaryColor,
      txtColor: AppColor.black);
  static ThemeData dark = darkTheme(
      bkColor: AppColor.black,
      sfBkColor: AppColor.black,
      appBrColor: AppColor.gray,
      txtColor: AppColor.white);
}
 // class MyTheme extends GetxController{
 // @override
 //  void onInit() {
 //    // TODO: implement onInit
 //    super.onInit();
 //    switchTheme();
 //    currentTheme();
 //  }
 //  static bool _isDark=true;
 //  ThemeData currentTheme(){
 //    return _isDark?AppTheme.dark:AppTheme.light;
 //  }
 //  void switchTheme(){
 //    _isDark=!_isDark;
 //    update();
 //  }
 // }