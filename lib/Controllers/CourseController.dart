import 'dart:io';
import 'package:flutter_tutorial/Config/constants.dart';
import 'package:get/get.dart';

import '../Helpers/DbHelper.dart';
import '../Models/CourseModel.dart';

class CourseController extends GetxController {
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


        // Fetch data from the local database
        final localCourses = await _databaseHelper.getCourses();
        courseList.value = localCourses;
        Get.snackbar("Info", "No internet connection. Showing local data.",
            snackPosition: SnackPosition.BOTTOM);

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


        // Fetch data from the local database
        final localCourses = await _databaseHelper.getCourses();
        courseDetail = localCourses.firstWhere((course) => course.id == courseId);

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

    try {
      isLoading(true);


        // Add to local database first
        final newCourse = CourseModel(
          id: DateTime
              .now()
              .millisecondsSinceEpoch % 0xFFFFFFFF,
          // Ensure the key is within range
          title: title,
          subject: subject,
          overview: overview,
          photo: photo?.path ?? '',
          createdAt: DateTime.now().toIso8601String(), // Add current timestamp
        );

        await _databaseHelper.insertCourse(newCourse);

        Get.snackbar('Info', 'Course saved locally. Sync with API when online.',
            snackPosition: SnackPosition.BOTTOM);

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


        Get.snackbar('Info', 'Course updated locally. Sync with API when online.',
            snackPosition: SnackPosition.BOTTOM);

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

        Get.snackbar('Info', 'Course deleted locally. Sync with API when online.',
            snackPosition: SnackPosition.BOTTOM);

    } catch (e) {
      Get.snackbar('Error', 'Failed to delete course: $e');
    } finally {
      isLoading(false);
    }
    getCourseList();
  }
}