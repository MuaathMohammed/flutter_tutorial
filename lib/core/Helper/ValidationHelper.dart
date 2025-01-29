import 'package:get/get.dart';
class ValidatorHelper extends GetxController{
  static String? validatePass(String value) {
    var pattern =
        r'(?=.*[a-z])(?=.*[A-Z])';
    var regEx = new RegExp(pattern);

    if (value.length < 6 || !regEx.hasMatch(value)) {
      return 'كلمة المرور اكثر من سته ارقام وتحتوي على حروف كبيرة وصفيرة';
    } else
      return null;
  }
  static String? validateInputPass(String value) {

    if (value.isEmpty ) {
      return 'الرجاء كتابة كلمة المرور ';
    } else
      return null;
  }
  static String? generalValidation(String value,String mesage) {
    if (value.isEmpty ) {
      return mesage;
    } else
      return null;
  }

  static String? validateAge(String value) {
    if (value.isEmpty)
      return 'العمر';
    else   if (value.startsWith(RegExp("[1-5]"))&&value.length<2)
      return  'اكثر من 5';
    else   if (value.startsWith(RegExp("[2-9]"))&&value.length>1)
      return  'اقل من20';
    else
      return null;
  }  static String? validateName(String value) {
    if (value.length < 3)
      return 'يجب ان يكون الاسم أكثر من 3 حروف';
    else
      return null;
  }
  static String? validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length < 9)
      return 'رقم الجوال يجب ان يكتب بطريقة صحيحة';
    else
      return null;
  }
  static String? validateEmail(String value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'أدخل البريد الألكتروني بطريقة صحيحة';
    else
      return null;
  }
}