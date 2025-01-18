import 'dart:io';
import 'package:flutter_tutorial/Config/constants.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../APIServices/DynamicApiServices.dart';
import '../Helpers/NetworkHelper.dart';
import '../Helpers/SQliteDbHelper.dart';
import '../Models/CourseModel.dart';

class CourseController extends GetxController {
  final ApiService _apiService = ApiService();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  var courseList = <CourseModel>[].obs;
  CourseModel? courseDetail;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getCourseList();
  }

  Future<void> getCourseList() async {
    try {
      isLoading(true);

      // Check internet connectivity
      final isConnected = await NetworkHelper.isConnected();

      if (isConnected) {
        // Fetch data from the API
        final response = await _apiService.get(baseAPIURLV1 + teachersAPI);
        if (response.statusCode == 200) {
          final apiCourses = (response.data as List)
              .map((json) => CourseModel.fromJson(json))
              .toList();

          // Fetch existing courses from the local database
          final localCourses = await _databaseHelper.getCourses();

          // Insert only missing courses into the local database
          for (var apiCourse in apiCourses) {
            final isCourseExists = localCourses.any((localCourse) => localCourse.id == apiCourse.id);
            if (!isCourseExists) {
              await _databaseHelper.insertCourse(apiCourse);
            }
          }

          // Update the UI with the latest data
          courseList.value = apiCourses;
        } else {
          Get.snackbar("Error", "Failed to fetch courses from API",
              snackPosition: SnackPosition.BOTTOM);
        }
      } else {
        // Fetch data from the local database
        final localCourses = await _databaseHelper.getCourses();
        courseList.value = localCourses;
        Get.snackbar("Info", "No internet connection. Showing local data.",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch courses: $e",
          snackPosition: SnackPosition.BOTTOM);
      print(e);
    } finally {
      isLoading(false);
    }
  }

  Future<void> getCourseDetails(int courseId) async {
    try {
      isLoading(true);

      // Check internet connectivity
      final isConnected = await NetworkHelper.isConnected();

      if (isConnected) {
        // Fetch data from the API
        final response = await _apiService.get("${baseAPIURLV1 + teachersAPI}$courseId/");
        if (response.statusCode == 200) {
          courseDetail = CourseModel.fromJson(response.data);
        }
      } else {
        // Fetch data from the local database
        final localCourses = await _databaseHelper.getCourses();
        courseDetail = localCourses.firstWhere((course) => course.id == courseId);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch course details: $e",
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }

  void addCourse({
    required String title,
    required String overview,
    required String subject,
    File? photo,
  }) async {
    var data;
    dio.Options options =
    dio.Options(headers: {'Content-Type': 'application/json'});
    try {
      isLoading(true);

      // Add to local database first
      final newCourse = CourseModel(
        id: DateTime.now().millisecondsSinceEpoch, // Temporary ID
        title: title,
        subject: subject,
        overview: overview,
        photo: photo?.path ?? '',
        createdAt: DateTime.now().toIso8601String(), // Add current timestamp
      );
      await _databaseHelper.insertCourse(newCourse);

      // Check internet connectivity
      final isConnected = await NetworkHelper.isConnected();

      if (isConnected) {
        // Sync with the API
        if (photo != null) {
          data = dio.FormData.fromMap({
            "subject": subject,
            "title": title,
            "overview": overview,
            "photo": dio.MultipartFile.fromFileSync(
              photo.path,
              filename: photo.path.split(Platform.pathSeparator).last,
            ),
          });
          options = dio.Options(headers: {'Content-Type': 'multipart/form-data'});
        } else {
          data = dio.FormData.fromMap({
            "subject": subject,
            "title": title,
            "overview": overview,
          });
        }

        final response = await _apiService.post(baseAPIURLV1 + teachersAPI + addAPI,
            data: data, options: options);
        if (response.statusCode == 201) {
          // Mark the course as synced in the local database
          Get.snackbar('Success', 'Course added successfully');
        } else {
          Get.snackbar('Error', response.data['error']);
        }
      } else {
        Get.snackbar('Info', 'Course saved locally. Sync with API when online.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to add course: $e');
    } finally {
      isLoading(false);
    }

    getCourseList();
  }

  void updateCourse(
      int courseId, {
        required String title,
        required String overview,
        required String subject,
        File? photo,
      }) async {
    var data;
    dio.Options options = dio.Options(
      headers: {'method': 'PUT', 'Content-Type': 'application/json'},
    );
    try {
      isLoading(true);

      // Update local database first
      final updatedCourse = CourseModel(
        id: courseId,
        title: title,
        subject: subject,
        overview: overview,
        photo: photo?.path ?? '',
        createdAt: DateTime.now().toIso8601String(), // Update timestamp
      );
      await _databaseHelper.updateCourse(updatedCourse);

      // Check internet connectivity
      final isConnected = await NetworkHelper.isConnected();

      if (isConnected) {
        // Sync with the API
        if (photo != null) {
          data = dio.FormData.fromMap({
            "subject": subject,
            "title": title,
            "overview": overview,
            "photo": dio.MultipartFile.fromFileSync(
              photo.path,
              filename: photo.path.split(Platform.pathSeparator).last,
            ),
          });
          options = dio.Options(
            headers: {'method': 'PUT', 'Content-Type': 'multipart/form-data'},
          );
        } else {
          data = dio.FormData.fromMap({
            "subject": subject,
            "title": title,
            "overview": overview,
          });
        }

        final response = await _apiService.put(
            '${baseAPIURLV1 + teachersAPI}$courseId/$updateAPI/',
            data: data,
            options: options);
        if (response.statusCode == 200) {

          Get.snackbar('Success', 'Course updated successfully');
          Get.back();
        } else {
          Get.snackbar('Error', response.data['error']);
        }
      } else {
        Get.snackbar('Info', 'Course updated locally. Sync with API when online.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update course: $e');
    } finally {
      isLoading(false);
    }

    getCourseList();
  }

  void deleteCourse(int courseId) async {
    try {
      isLoading(true);

      // Delete from local database first
      await _databaseHelper.deleteCourse(courseId);

      // Check internet connectivity
      final isConnected = await NetworkHelper.isConnected();

      if (isConnected) {
        // Sync with the API
        final response =
        await _apiService.delete('${baseAPIURLV1 + teachersAPI}$courseId/$deleteAPI/');
        if (response.statusCode == 204) {
          Get.snackbar('Success', 'Course deleted successfully');
          Get.back();
        } else {
          Get.snackbar('Error', response.data['error']);
        }
      } else {
        Get.snackbar('Info', 'Course deleted locally. Sync with API when online.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete course: $e');
    } finally {
      isLoading(false);
    }
    getCourseList();
  }
}