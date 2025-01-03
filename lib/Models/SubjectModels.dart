class Subject {
  final String title;
  final String slug;
  final String photo;
  final int totalCourses;

  Subject({
    required this.title,
    required this.slug,
    required this.photo,
    required this.totalCourses,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      title: json['title'],
      slug: json['slug'],
      photo: json['photo'],
      totalCourses: json['total_courses'],
    );
  }
}