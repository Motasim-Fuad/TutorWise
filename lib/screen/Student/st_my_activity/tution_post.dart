import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/resources/app_url/app_url.dart';
import '../../../screen_models/Controller/Student/StudentProfileScreenModel.dart';
import '../../../screen_models/Controller/Student/student_tution_post_ScreenModel.dart';
import '../../../utils/app_textStyle.dart';

class TutionPostScreen extends StatelessWidget {
  const TutionPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StudentTutionPostController());
    final _st_profilecontroller = Get.put(StudentProfileScreenModel());

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.error.isNotEmpty) {
        return Center(child: Text(controller.error.value));
      }

      if (controller.postList.isEmpty) {
        return const Center(child: Text('No posts found.'));
      }

      return ListView.builder(
        itemCount: controller.postList.length,
        itemBuilder: (context, index) {
          final post = controller.postList[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage("${AppUrl.baseurl}${post.profilePicture}"),
                      ),
                      Text(_st_profilecontroller.profile.value.fullName.toString(),style: Theme.of(context).textTheme.titleLarge,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(strokeAlign :1,color: Colors.grey),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Text(post.jobTitle.toString(),
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text('Curriculum: ${post.curriculum}'),
                  Text('Class: ${post.educationalLevelChoices}'),
                  Text('Subject(s): ${post.subject is List ? post.subject.join(", ") : post.subject}'),
                  Text('Budget: ৳${post.budgetAmount}'),
                  Text('Gender: ${post.gender}'),
                  Text('Lesson Type: ${post.lessonType}'),
                  Text('Days per Week: ${post.daysPerWeek}'),
                  Text('Days per Week: ${post.daysPerWeek}'),
                  const SizedBox(height: 6),
                  Text(
                    'Comments: ${post.additionalComment is List ? post.additionalComment.join(", ") : post.additionalComment}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
