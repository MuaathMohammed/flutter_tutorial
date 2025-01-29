import 'package:flutter/material.dart';
import 'package:flutter_tutorial/Views/LoginPage.dart';
import 'package:get/get.dart';

import 'Config/InitializeHive.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await inilizeHive();
  await Future.delayed(Duration(seconds: 10));

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginPage(),
    );
  }
}





