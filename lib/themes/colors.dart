
import 'package:flutter/material.dart';

class AppColors{
  static const Color primary = Color(0xFF0D47A1);
  static const Color secondary = Color(0xFF1590AB);
  static const Color background = Color(0xFFF5F5F5);
  static const Color text = Color(0xFF212121);
  static const Color accent = Color(0xFF92D8E2);
}

const Color primaryColor = Color(0xFF0D47A1);
const Color primaryColorDark = Color(0xFF0D47A1);
const Color accentColor = Color(0xFF92D8E2);
const Color blackColor = Colors.black; // Opaque white
const Color baseColor = Color(0xFF2196F3);
final Color semiTransparent = baseColor.withOpacity(0.5);



const MaterialColor customBlue = MaterialColor(
  0xFF2196F3, // Base color
  <int, Color>{
    50: Color(0xFFE3F2FD), // Lightest shade
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(0xFF2196F3), // Base color
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1), // Darkest shade
    1000: Color(0xFF022D71), // Darkest shade
  },
);




class AppGradients {
  // Common gradient for button backgrounds
  static final LinearGradient buttonGradient = LinearGradient(
    colors: [
      Color(0xFF8CC0C6), // Light Blue
      Color(0xFF92D8E2), // Blue
      Color(0xFF095E6A), // Blue
      Color(0xFFA76825), // Blue
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,

  );

  // Gradient for background or containers
  static final LinearGradient backgroundGradient = LinearGradient(
    colors: [
      Color(0xff1cc3da), // Purple
      Color(0xff629399), // Blue
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static final LinearGradient backgroundGradientDark = LinearGradient(
    colors: [
      Color(0xff0a555f), // Purple
      Color(0xff6e8c90), // Blue
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );
}