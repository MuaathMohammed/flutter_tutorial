import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/Config/constants.dart';
import 'package:flutter_tutorial/Controllers/HomeController.dart';
import 'package:flutter_tutorial/Controllers/LoginController.dart';
import 'package:flutter_tutorial/Themes/Colors.dart';
import 'package:get/get.dart';
import 'CoursePage.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Subjects",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: secondaryColor,
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            Get.find<LoginController>().logout();
          }, icon: Icon(Icons.logout)),
          IconButton(onPressed: (){
            Get.to(()=>CoursesPage());
          }, icon: Icon(Icons.add))
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
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              primaryColor,
              secondaryColor,
            ],
          ),
        ),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          }

          if (controller.subjects.isEmpty) {
            return const Center(
              child: Text(
                "No subjects available.",
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
              await controller.refreshSubjects();
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.subjects.length,
              itemBuilder: (_, index) {
                final subject = controller.subjects[index];
                return AnimatedOpacity(
                  opacity: controller.isLoading.value ? 0 : 1,
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
                        // Move to Course Page
                        Get.to(CoursesPage());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                               child:CachedNetworkImage(
                                 imageUrl: baseURL + subject.photo,
                                 placeholder: (context, url) => CircularProgressIndicator(),
                                 errorWidget: (context, url, error) => Icon(Icons.error),
                                 height: 100,
                                 width: 100,
                               ),
                              //
                              // Image.network(
                              //   "${baseURL + subject.photo}",
                              //   width: 60,
                              //   height: 60,
                              //   fit: BoxFit.cover,
                              //   errorBuilder: (context, error, stackTrace) {
                              //     return Container(
                              //       width: 60,
                              //       height: 60,
                              //       decoration: BoxDecoration(
                              //         color: primaryColor,
                              //         borderRadius: BorderRadius.circular(10),
                              //       ),
                              //       child: const Icon(
                              //         Icons.error,
                              //         color: primaryColor,
                              //       ),
                              //     );
                              //   },
                              // ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    subject.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Total courses: ${subject.totalCourses}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: primaryColor,
                            ),
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
    );
  }
}