import 'package:flutter/material.dart';
import 'package:flutter_tutorial/Config/constants.dart';
import 'package:flutter_tutorial/Models/SubjectModels.dart';
import 'package:flutter_tutorial/Views/CourseDetailsPage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../Controllers/CourseController.dart';
import '../Controllers/HomeController.dart';
import '../Models/CourseModel.dart';
import '../Themes/Colors.dart';

class CoursesPage extends StatelessWidget {
  final CourseController _controller = Get.put(CourseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Courses",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            _controller.getCourseList();
          }, icon: Icon(Icons.refresh))
        ],
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 10,
        shadowColor: primaryColor.withOpacity(0.5),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          color: Colors.black12,
        ),
        child: Obx(() {
          if (_controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }

          if (_controller.courseList.isEmpty) {
            return const Center(
              child: Text(
                "No course available.",
                style: TextStyle(
                  fontSize: 18,
                  color: primaryColor,
                ),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              // Trigger the refresh logic
              await _controller.getCourseList();
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _controller.courseList.length,
              itemBuilder: (context, index) {
                final course = _controller.courseList[index];
                return AnimatedOpacity(
                  opacity: _controller.isLoading.value ? 0 : 1,
                  duration: const Duration(milliseconds: 500),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.only(bottom: 16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        Get.to(CourseDetailsPage(course.id));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Material(
                              elevation: 2,
                              borderRadius: BorderRadius.circular(8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                   File(course.photo!),
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.image_not_supported_rounded,
                                        color: primaryColor,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    course.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "subject: ${course.subject}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: textColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    _showAddCourseDialog(course);
                                  },
                                  child: Icon(
                                    Icons.edit,
                                    color: secondaryColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                InkWell(
                                  onTap: () {
                                    _showDeleteCourseDialog(course.id);
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: primaryColor,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddCourseDialog(null);
        },
        child: const Icon(Icons.add),
        backgroundColor: primaryColor,
        foregroundColor: backgroundColor,
        elevation: 10,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _showAddCourseDialog(CourseModel? course) {
    var subjects = Get.find<HomeController>().subjects;
    final _formKey = GlobalKey<FormState>();
    Rx<File?> courseImage = Rx<File?>(null);
    if(subjects.length<=0){
      subjects.add(SubjectModel(title: 'Flutter', slug: 'Programming', photo: '', totalCourses: 1));
    }
    var titleController = TextEditingController();
    var overviewController = TextEditingController();
    String selectedSubject = subjects.first.slug;

    if (course != null) {
      titleController.text = course.title;
      overviewController.text = course.overview;
      if(subjects.length<=0){
        subjects.add(SubjectModel(title: 'Flutter', slug: 'Programming', photo: '', totalCourses: 1));
      }else{

        selectedSubject = subjects
            .firstWhere(
              (element) => element.title == course.subject,
          orElse: () =>subjects.first, // Fallback subject
        )
            .slug;
        if(selectedSubject==null){
          selectedSubject=subjects.first.slug;
        }
        print(selectedSubject);
      }

    }

    Future<void> _pickImage() async {
      final pickedFile =
      await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        courseImage.value = File(pickedFile.path);
      }
    }

    Get.defaultDialog(
      title: 'New Course',
      backgroundColor: backgroundColor,
      content: Obx(() {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  value: selectedSubject,
                  items: subjects
                      .map((e) => DropdownMenuItem(
                    value: e.slug,
                    child: Text(e.title),
                  ))
                      .toList(),
                  onChanged: (value) {
                    selectedSubject = value!;
                  },
                  decoration: InputDecoration(labelText: 'Select Subject'),
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please select a subject'
                      : null,
                ),
                TextFormField(
                  controller: titleController,
                  decoration: (course == null)
                      ? InputDecoration(labelText: 'Title')
                      : null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a course name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    titleController.text = value!;
                  },
                ),
                TextFormField(
                  controller: overviewController,
                  decoration: (course == null)
                      ? InputDecoration(labelText: 'Overview')
                      : null,
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    overviewController.text = value!;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text(
                      (course == null) ? 'Choose Course photo' : 'edit photo'),
                ),
                Obx(() {
                  return courseImage.value != null
                      ? Image.file(
                    courseImage.value!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                      : course != null && course.photo != null
                      ? Image.file(File(course.photo!),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("No image available"),
                      );
                    },
                  )
                      : Text('No image selected');
                }),
              ],
            ),
          ),
        );
      }),
      textCancel: 'Cancel',
      textConfirm: (course == null) ? 'Add' : 'Update',
      onCancel: () {},
      onConfirm: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          if (selectedSubject == null) {
            Get.snackbar('Error', 'Please select a subject');
            return;
          }

          if (course == null) {
            _controller.addCourse(
              title: titleController.text,
              overview: overviewController.text,
              subject: selectedSubject,
              photo: courseImage.value,
            );
          } else {
            _controller.updateCourse(
              course.id,
              title: titleController.text,
              overview: overviewController.text,
              subject: selectedSubject,
              photo: courseImage.value,
            );
          }
          Get.back();
        }
      },
    );
  }

  void _showDeleteCourseDialog(int courseId) {
    Get.defaultDialog(
      title: 'Delete Course',
      content: Text('Are you sure you want to delete this course?'),
      textCancel: 'Cancel',
      textConfirm: 'Delete',
      onCancel: () {},
      onConfirm: () {
        _controller.deleteCourse(courseId);
        Get.back();
      },
    );
  }
}