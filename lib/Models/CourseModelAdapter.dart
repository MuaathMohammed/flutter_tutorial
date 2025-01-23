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
  void write(BinaryWriter writer, CourseModel obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.subject);
    writer.write(obj.overview);
    writer.write(obj.photo);
    writer.write(obj.createdAt);
  }
}