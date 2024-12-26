import 'package:flutter/material.dart';
import 'package:flutter_tutorial/GetX/Views/GetxHome.dart';
import 'package:flutter_tutorial/config/routes.dart';
import 'package:flutter_tutorial/views/home_page.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Provider/Notifier/ThemeNotifier.dart';
import 'helpers/Localization/AppLanguage.dart';
import 'helpers/Localization/translate.dart';
import 'themes/dark_theme.dart';
import 'themes/light_theme.dart';
import 'views/login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Create an instance of AppLanguage and initialize it
  final appLanguage = AppLanguage();
   appLanguage.onInit(); // Ensure the language is loaded before app starts
  // Register AppLanguage instance in GetX
  Get.put(appLanguage);
  runApp(MyApp(appLanguage: appLanguage));
}


class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;

  const MyApp({Key? key, required this.appLanguage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: translate(), // Add translations
      locale: Locale(Get.find<AppLanguage>().appLocal), // Dynamically set locale
      home: GetxHome(),
    );
  }
}

//
// void main() {
//
//   //runApp(const MyApp());
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => ThemeNotifier(),
//       child: const MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeNotifier>(context);
//
//     bool isDarkMode = false;
//
//     return MaterialApp(
//       title: 'Flutter Demo',
//       themeMode: themeProvider.themeMode,  // Set theme mode based on the provider
//       theme: themeProvider.currentTheme,
//       initialRoute: baseRoute,
//       navigatorKey: RouterManager.navigatorKey,
//       onGenerateRoute: RouterManager.generateRoute,
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
//









// void main() {
//
//   //runApp(const MyApp());
//   runApp( const MyApp(),
//
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: baseRoute,
//       navigatorKey: RouterManager.navigatorKey,
//       onGenerateRoute: RouterManager.generateRoute,
//     );
//   }
// }

















