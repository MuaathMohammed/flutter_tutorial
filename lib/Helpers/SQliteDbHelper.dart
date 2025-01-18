import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../Models/CourseModel.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'courses.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onHamud,
    );
  }

  Future<void> _onHamud(Database db, int version) async {
    await db.execute('''
      CREATE TABLE courses(
        id INTEGER PRIMARY KEY,
        title TEXT,
        subject TEXT,
        overview TEXT,
        photo TEXT,
        createdAt TEXT
      )
    ''');
  }

  // Get all courses from the database
  Future<List<CourseModel>> getCourses() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query('courses');

      if (maps.isEmpty) {
        return []; // Return an empty list if no courses are found
      }
      // List<CourseModel> list= <CourseModel>[];
      // for (var x in maps){
      //   list.add(CourseModel.fromJson(x));
      // }
      // return list;
    List<CourseModel> list=List.generate(maps.length, (i) {
      return CourseModel.fromJson(maps[i]);
    });
      return list ;
    } catch (e) {
      print('Error fetching courses: $e');
      return []; // Return an empty list in case of an error
    }
  }

  // Insert a course into the database
  Future<int> insertCourse(CourseModel course) async {
    try {
      final db = await database;
      return await db.insert(
        'courses',
        {
          'id': course.id,
          'title': course.title ?? '', // Provide a default value for title
          'subject': course.subject ?? '', // Provide a default value for subject
          'overview': course.overview ?? '', // Provide a default value for overview
          'photo': course.photo ?? '', // Provide a default value for photo
          'createdAt': course.createdAt ?? DateTime.now().toIso8601String(), // Default to current timestamp
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print('Error inserting course: $e');
      return -1; // Return -1 to indicate an error
    }
  }

  // Update a course in the database
  Future<int> updateCourse(CourseModel course) async {
    try {
      final db = await database;
      return await db.update(
        'courses',
        course.toJson(),
        where: 'id = ?',
        whereArgs: [course.id],
      );
    } catch (e) {
      print('Error updating course: $e');
      return -1; // Return -1 to indicate an error
    }
  }

  // Delete a course from the database
  Future<int> deleteCourse(int id) async {
    try {
      final db = await database;
      return await db.delete(
        'courses',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print('Error deleting course: $e');
      return -1; // Return -1 to indicate an error
    }
  }
}