import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_tutorial/APIServices/DioClient.dart';
import 'package:flutter_tutorial/Config/constants.dart';
import 'package:flutter_tutorial/Helpers/NetworkHelper.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../Models/SubjectModels.dart';

class HomeController extends GetxController {
  var subjects = <SubjectModel>[].obs; // Observable list of subjects
  var isLoading = true.obs; // Loading state
  var isRefreshing = false.obs; // Refresh state

  final DioClient _dio = DioClient(); // Replace with your base URL
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    fetchSubjects();

    // Listen for network changes
    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> results) {
      // Check if any of the results indicate an active internet connection
      if (results.any((result) => result != ConnectivityResult.none)) {
        // Internet is available, refresh the data
        refreshSubjects();
      }
    });
  }

  // Fetch subjects from API
  Future<void> fetchSubjects() async {
    try {
      isLoading(true);

      // Check internet connectivity
      final isConnected = await NetworkHelper.isConnected();

      if (isConnected) {
        final response = await _dio.dio.get(baseAPIURLV1 + subjectsAPI); // Replace with your endpoint

        if (response.statusCode == 200) {
          // Parse the response into a list of Subject objects
          subjects.value = (response.data as List)
              .map((json) => SubjectModel.fromJson(json))
              .toList();
        } else {
          Get.snackbar("Error", "Failed to fetch subjects",
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        Get.snackbar("Info", "No internet connection. Showing local data.",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
      isRefreshing(false); // Stop the refreshing indicator
    }
  }

  // Refresh subjects
  Future<void> refreshSubjects() async {
    isRefreshing(true); // Start the refreshing indicator
    await fetchSubjects(); // Fetch the latest data
  }
}