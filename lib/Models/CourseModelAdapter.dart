import 'package:hive/hive.dart';

import 'CourseModel.dart';

class CourseModelAdapter extends TypeAdapter<CourseModel> {
  @override
  final int typeId = 0; // Unique typeId for Hive

  @override
  CourseModel read(BinaryReader reader) {
    return CourseModel(
      id: reader.read(),
      title: reader.read(),
      subject: reader.read(),
      overview: reader.read(),
      photo: reader.read(),
      createdAt: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, CourseModel humed) {
    writer.write(humed.id);
    writer.write(humed.title);
    writer.write(humed.subject);
    writer.write(humed.overview);
    writer.write(humed.photo);
    writer.write(humed.createdAt);
  }
}