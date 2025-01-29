import 'package:hive/hive.dart';
import '../Models/CourseModel.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Box<CourseModel>? _coursesBox;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Box<CourseModel>> get coursesBox async {
    if (_coursesBox != null) return _coursesBox!;
    _coursesBox = await Hive.openBox<CourseModel>('coursesBox');
    return _coursesBox!;
  }

  // Get all courses from the database
  Future<List<CourseModel>> getCourses() async {
    try {
      final box = await coursesBox;

      final courses = box.values.toList();
      print("Fetched ${courses.length} courses from the database"); // Debug print
      return courses;
    } catch (e) {
      print('Error fetching courses: $e');
      return []; // Return an empty list in case of an error
    }
  }
  Future<CourseModel?> getCourse(id) async {
    try {
      final box = await coursesBox;
      //final course = box.values.where((t)=>t.id==id).firstOrNull;
      final course = box.get(id);
      print("Fetched ${course} course from the database"); // Debug print
      return course;
    } catch (e) {
      print('Error fetching courses: $e');
      return null; // Return an empty list in case of an error
    }
  }

  // Insert a course into the database
  Future<int> insertCourse(CourseModel course) async {
    try {
      final box = await coursesBox;
      await box.put(course.id,course); // Use the course ID as the key
      print("Inserted course with ID: ${course.id}"); // Debug print
      return course.id;
    } catch (e) {
      print('Error inserting course: $e');
      return -1; // Return -1 to indicate an error
    }
  }

  // Update a course in the database
  Future<int> updateCourse(CourseModel course) async {
    try {
      final box = await coursesBox;
      await box.put(course.id, course); // Update the course by ID
      print("Updated course with ID: ${course.id}"); // Debug print
      return course.id;
    } catch (e) {
      print('Error updating course: $e');
      return -1; // Return -1 to indicate an error
    }
  }

  // Delete a course from the database
  Future<int> deleteCourse(int id) async {
    try {
      final box = await coursesBox;
      await box.delete(id); // Delete the course by ID

      print("Deleted course with ID: $id"); // Debug print
      return id;
    } catch (e) {
      print('Error deleting course: $e');
      return -1; // Return -1 to indicate an error
    }
  }
  Future<void> clearBox() async{
    try {
      final box = await coursesBox;
     await box.clear(); // Delete the course by ID

    } catch (e) {
      print('Error deleting course: $e');
    }
  }
}