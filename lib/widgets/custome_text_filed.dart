import 'package:flutter/material.dart';
import 'package:flutter_tutorial/themes/colors.dart';





class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.obscureText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access the current theme
    final isDarkMode = theme.brightness == Brightness.dark; // Check if dark mode is active

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 14, // Label text size
          color: isDarkMode ? Colors.white70 : AppColors.primary, // Adjust color based on theme
        ),
        hintText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        filled: true,
        fillColor: isDarkMode ? Colors.grey[900] : Colors.white, // Adjust background color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none, // No initial border
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: isDarkMode ? Colors.grey[700]! : AppColors.accent, // Adjust color based on theme
            width: 15.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: isDarkMode ? Colors.blueAccent : AppColors.secondary, // Adjust color based on theme
            width: 3.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: isDarkMode ? Colors.yellow[700]! : Colors.yellow, // Adjust color based on theme
            width: 3.0,
          ),
        ),
      ),
    );
  }
}
