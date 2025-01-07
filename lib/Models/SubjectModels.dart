class SubjectModel {
  final String title;
  final String slug;
  final String photo;
  final int totalCourses;

  SubjectModel({
    required this.title,
    required this.slug,
    required this.photo,
    required this.totalCourses,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      title: json['title'],
      slug: json['slug'],
      photo: json['photo'],
      totalCourses: json['total_courses'],
    );
  }
}