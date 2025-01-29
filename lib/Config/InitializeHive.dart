import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../Models/CourseModel.dart';
import '../Models/CourseModelAdapter.dart';

inilizeHive()async{
  await Hive.initFlutter(); // Initialize Hive
  Hive.registerAdapter(CourseModelAdapter()); // Register the adapter

  await Hive.openBox<CourseModel>('coursesBox');//to open the box as table
}