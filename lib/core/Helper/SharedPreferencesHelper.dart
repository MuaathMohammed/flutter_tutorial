import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{

  static String sharedPreferenceUserIDKey = "Id";
  static String sharedPreferenceUserLoggedInKey = "LoggedIn";
  static String sharedPreferenceUserNameKey = "USERNAMEKEY";
  static String sharedPreferenceUserEmailKey = "USEREMAILKEY";
  static String sharedPreferenceTypeKey = "CHILD";
  static String sharedPreferenceTokenKey = "token";
  static String uid = "uid";
  static String pid = "pid";
  static String Suid = "suid";
  static String Spid = "spid";
  static String key = "key";
  static String PidDFBToken = "dfbtoken";
  /// saving data to sharedpreference
  static Future<bool> saveUserLoggedInSharedPreference(bool isUserLoggedIn) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSharedPreference(String? userName) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserNameKey, userName!);
  }

  static Future<bool> saveUserEmailSharedPreference(String? userEmail) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserEmailKey, userEmail!);
  }

  static Future<bool> saveTypeSharedPreference(String type) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceTypeKey, type);
  }

  static Future<bool> saveUserIDSharedPreference(String? type) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserIDKey, type!);
  }

  static Future<bool> saveUserTokenSharedPreference(String? type) async{
    print("My Token Is$type");
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.setString(sharedPreferenceTokenKey, type!);
  }

  static Future<bool> saveUserUid(String type) async{
    print("My Sheared Uid $type");

    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(uid, type);
  }

  static Future<bool> saveUserPid(String? type) async{
    print("My Sheared Pid $type");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(pid, type??"");
  }

  static Future<bool> saveUserSUid(String? type) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(Suid, type!);
  }

  static Future<bool> saveUserSPid(String? type) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(Spid, type!);
  }
  static Future<bool> savePIDDFBToken(String? type) async{
    print("pid Device Token $type");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(PidDFBToken, type!);
  }


  static Future<bool> deleteUserLoggedInSharedPreference(bool isUserLoggedIn) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> deleteUserNameSharedPreference(String userName) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.remove(sharedPreferenceUserNameKey);
  }

  static Future<bool> deleteUserEmailSharedPreference(String userEmail) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.remove(sharedPreferenceUserEmailKey);
  }
  static Future<bool> deleteTypeSharedPreference(String type) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await  preferences.remove(sharedPreferenceTypeKey);

  }
  static Future<bool> deleteUserIDSharedPreference(String type) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await  preferences.remove(sharedPreferenceUserIDKey);

  }
  static Future<bool> deleteUserTokenSharedPreference(String type) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await  preferences.remove(sharedPreferenceTokenKey);

  }

  static Future<bool> deleteUserUid(String type) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await  preferences.remove(uid);

  }
  static Future<bool> deleteUserPid(String type) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await  preferences.remove(pid);

  }
  static Future<bool> deleteUserSUid(String type) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await  preferences.remove(Suid);

  }
  static Future<bool> deleteUserSPid(String type) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await  preferences.remove(Spid);

  }
  static Future<bool> deletePidDFBToken(String type) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await  preferences.remove(PidDFBToken);

  }

  /// fetching data from sharedpreference
  static Future<bool?> getUserLoggedInSharedPreference() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(sharedPreferenceUserLoggedInKey);
  }

  static Future<String?> getUserNameSharedPreference() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? name= await preferences.getString(sharedPreferenceUserNameKey);
    return name;
  }

  static Future<String?> getUserEmailSharedPreference() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUserEmailKey);
  }
  static Future<String?> getTypeSharedPreference() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? type=await preferences.getString(sharedPreferenceTypeKey);
    return type;;
  }
  static Future<String?> getUserIDSharedPreference() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? ID=await preferences.getString(sharedPreferenceUserIDKey);
    return ID;
  }
  static Future<String?> getUserTokenSharedPreference() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceTokenKey);
  }
  static  getUserToken() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token= preferences.getString(sharedPreferenceTokenKey);
    return token;
  }
  static Future<String?>  getUserUid() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? UID= await preferences.getString(uid);
    return UID;
  } 
  static Future<String?> getUserPid() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? PID=await preferences.getString(pid);
    return PID;
  }  static Future<String?>  getUserSUid() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? SUID= await preferences.getString(Suid);
    return SUID;
  }
  static Future<String?> getUserSPid() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? SPID= await preferences.getString(Spid);
    return SPID;
  }
  static Future<String?> getPidDFBToken() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? TPID= await preferences.getString(PidDFBToken);
    return TPID;
  }

}