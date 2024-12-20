class AppRegex {
  // Matches a valid email address
  static final RegExp email = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

  // Matches a strong password (minimum 8 characters, includes at least one letter and one number)
  static final RegExp strongPassword = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  // Matches a valid phone number (example for 10-digit numbers)
  static final RegExp phoneNumber = RegExp(r'^\d{10}$');

  // Matches a valid URL
  static final RegExp url = RegExp(
    r'^(https?:\/\/)?([\w\-])+\.{1}([a-zA-Z]{2,63})([\/\w\-\.]*)*\/?$',
  );

  // Matches a valid name (only letters, allows spaces and hyphens)
  static final RegExp name = RegExp(r'^[a-zA-Z\s\-]+$');

  // Matches only digits
  static final RegExp digits = RegExp(r'^\d+$');

  // Matches alphanumeric characters
  static final RegExp alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');

  // Matches a hex color code (e.g., #FFFFFF)
  static final RegExp hexColor = RegExp(r'^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$');
}




//This is function for email validation
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  if (!AppRegex.email.hasMatch(value)) {
    return 'Please enter a valid email';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  return null;
}