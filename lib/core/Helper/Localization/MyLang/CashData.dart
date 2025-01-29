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