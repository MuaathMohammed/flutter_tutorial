import 'package:shared_preferences/shared_preferences.dart';

class CashData{
  SharedPreferences? prefs;


  Future saveLanguageState(selectedLanguage) async {
    prefs=await SharedPreferences.getInstance();
    prefs?.setString('lang', selectedLanguage);
  }

  Future<String?> get selectedLanguage async{
    prefs=await SharedPreferences.getInstance();
    return prefs?.getString("lang");
  }

}





















// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
//
// class CashData extends GetxController {
//   // Using GetStorage for local storage
//   final GetStorage _box = GetStorage();
//
//   // Save language state
//   Future saveLanguageState(String selectedLanguage) async {
//     await _box.write('lang', selectedLanguage);
//   }
//
//   // Get selected language
//   String? get selectedLanguage => _box.read('lang');
// }
























