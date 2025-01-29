import 'dart:convert';
import 'package:intl/intl.dart';
class TokenValue{
 static Map<String, dynamic> parseJwt(token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  static String decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }
 static String decode(String toDecode) {
   String res;
   try {
     while (toDecode.length * 6 % 8 != 0) {
       toDecode += "=";
     }
     res = utf8.decode(base64.decode(toDecode));
   } catch (error) {
     throw Exception("decodeBase64([toDecode=$toDecode]) \n\t\terror: $error");
   }
   return res;
 }
}
 String convertDateTimeDisplay(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}
List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate,{type}) {
  List<DateTime> days = [];
  var d=    endDate.add(new Duration(days: 1));
  print(d);
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(DateTime(startDate.day+i));}
  // dam =type=='week'? days.map((string) => DateFormat("E").format(string)).toList():days.map((string) => DateFormat("yy").format(string)).toList();
  //  dam=days;
  print(days);
  return days;
}
int getTimeBetweenTowDateInMinutes(DateTime startDate, DateTime endDate,{type}) {
  int days ;
  var d=    endDate.add(new Duration(days: 1));
  print(d);
 days =endDate.difference(startDate).inMilliseconds;
  // dam =type=='week'? days.map((string) => DateFormat("E").format(string)).toList():days.map((string) => DateFormat("yy").format(string)).toList();
  //  dam=days;
  return days;
}
 String convertDateFromTimestamp(int timestamp){
DateTime x  = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
return DateFormat("dd-MM-yyyy hh:mm:ss").format(x);
}
 String convertDateFromTimestampDD(int timestamp){
DateTime x  = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
return DateFormat("dd-MM-yyyy").format(x);
}
 String convertDateFromTimestampMM(int timestamp){
DateTime x  = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
return DateFormat("hh:mm:ss").format(x);
}