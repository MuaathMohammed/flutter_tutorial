import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  static Future<bool> isConnected() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      return connectivityResult != ConnectivityResult.none;
    } catch (e) {
      print('Error checking connectivity: $e');
      return false;
    }
  }
  static Future<bool> hasInternetAccess() async {
    try {

      final response = await http
          .get(Uri.parse('https://www.google.com'))
          .timeout(Duration(seconds: 5));
      return response.statusCode == 200;
    } catch (e) {
      print('Error checking internet access: $e');
      return false;
    }
  }

  static Future<bool> isNetworkAvailable() async {
    try {
      final isDeviceConnected = await isConnected();
      if (!isDeviceConnected) {
        return false;
      }

      final hasInternet = await hasInternetAccess();
      return hasInternet;
    } catch (e) {
      print('Error checking network availability: $e');
      return false;
    }
  }
}