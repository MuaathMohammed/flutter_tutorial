abstract class BaseModel {
  int? id;
  Map<String, dynamic> toJson();
  BaseModel fromJson(Map<String, dynamic> json);
}
