import 'package:flutter/material.dart';
import 'package:flutter_tutorial/Config/constants.dart';
import 'package:get/get.dart';

import '../Controllers/CourseController.dart';
import '../Models/CourseModel.dart';
import '../Themes/Colors.dart';


class CourseDetailsPage extends StatelessWidget {
  final CourseController _controller = Get.put(CourseController());
  final courseID;

  CourseDetailsPage(this.courseID);

  @override
  Widget build(BuildContext context) {
    _controller.getCourseDetails(courseID);
    CourseModel? course = _controller.courseDetail;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Course Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 10,
        shadowColor: primaryColor.withOpacity(0.5),
      ),
      body: course == null
          ? const Center(
        child: Text("No course available"),
      )
          : Container(
        width: 500,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30)),
            color: Colors.black12),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "${baseURL + course.photo!}",
                      width: 512,
                      height: 256,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 512,
                          height: 256,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.image_not_supported,
                            color: primaryColor,
                            size: 128,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            course.title,
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          Text(
                            course.createdAt,
                            style: TextStyle(
                              fontSize: 14,
                              color: textColor,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        course.subject,
                        style: TextStyle(
                          fontSize: 24,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          course.overview,
                          style: TextStyle(
                            fontSize: 18,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}