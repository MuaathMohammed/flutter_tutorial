import 'package:flutter_tutorial/APIServices/DioClient.dart';
import 'package:flutter_tutorial/Config/constants.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

import '../Models/SubjectModels.dart';

class HomeController extends GetxController {
  var subjects = <Subject>[].obs; // Observable list of subjects
  var isLoading = true.obs; // Loading state

  final DioClient _dio = DioClient(); // Replace with your base URL

  @override
  void onInit() {
    super.onInit();
    fetchSubjects();
  }

  // Fetch subjects from API
  Future<void> fetchSubjects() async {
    try {
      isLoading(true);
      final response = await _dio.dio.get(baseAPIURLV1+subjectsAPI); // Replace with your endpoint

      if (response.statusCode == 200) {
        // Parse the response into a list of Subject objects
        subjects.value = (response.data as List)
            .map((json) => Subject.fromJson(json))
            .toList();
      } else {
        Get.snackbar("Error", "Failed to fetch subjects",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
