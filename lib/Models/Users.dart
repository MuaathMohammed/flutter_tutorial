class User {
  String name;
  int age;
  String gender; // 'ذكر' for male, 'أنثى' for female
  String notes;
  int score;
  String date; // Store date as a string

  User({
    required this.name,
    required this.age,
    required this.gender,
    required this.notes,
    required this.score,
    required this.date,
  });
}