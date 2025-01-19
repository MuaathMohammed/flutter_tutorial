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
    print("Database path: $path"); // Debug print

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    print("Creating courses table"); // Debug print
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
      print("Fetched ${maps.length} courses from the database"); // Debug print

      if (maps.isEmpty) {
        return []; // Return an empty list if no courses are found
      }

      List<CourseModel> list = List.generate(maps.length, (i) {
        return CourseModel.fromJson(maps[i]);
      });
      return list;
    } catch (e) {
      print('Error fetching courses: $e');
      return []; // Return an empty list in case of an error
    }
  }

// Insert a course into the database
  Future<int> insertCourse(CourseModel course) async {
    try {
      final db = await database;
      final id = await db.insert(
        'courses',
        course.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print("Inserted course with ID: $id"); // Debug print
      return id;
    } catch (e) {
      print('Error inserting course: $e');
      return -1; // Return -1 to indicate an error
    }
  }

// Update a course in the database
  Future<int> updateCourse(CourseModel course) async {
    try {
      final db = await database;
      final rowsUpdated = await db.update(
        'courses',
        course.toJson(),
        where: 'id = ?',
        whereArgs: [course.id],
      );
      print("Updated $rowsUpdated course(s)"); // Debug print
      return rowsUpdated;
    } catch (e) {
      print('Error updating course: $e');
      return -1; // Return -1 to indicate an error
    }
  }

// Delete a course from the database
  Future<int> deleteCourse(int id) async {
    try {
      final db = await database;
      final rowsDeleted = await db.delete(
        'courses',
        where: 'id = ?',
        whereArgs: [id],
      );
      print("Deleted $rowsDeleted course(s)"); // Debug print
      return rowsDeleted;
    } catch (e) {
      print('Error deleting course: $e');
      return -1; // Return -1 to indicate an error
    }
  }
}