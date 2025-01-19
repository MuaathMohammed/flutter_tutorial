class CourseModel {
  final int id;
  final String title;
  final String subject;
  final String overview;
  final String? photo;
  final String createdAt;

  CourseModel({
    required this.id,
    required this.title,
    required this.subject,
    required this.overview,
    this.photo,
    required this.createdAt,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    id: json['id'] as int,
    title: json['title'] as String,
    subject: json['subject'] as String,
    overview: json['overview'] as String,
    photo: json['photo'] as String?, // Nullable
    createdAt: json['createdAt'] as String,
  );
  // Convert the model to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subject': subject,
      'overview': overview,
      'photo': photo,
      'createdAt': createdAt,
    };
  }
}