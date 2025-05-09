import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorapp/utils/utils.dart';
import '../../../resources/app_url/app_url.dart';
import '../../../resources/routes/route_name.dart';
import '../../../screen_models/Controller/Student/StudentProfileScreenModel.dart';
import '../../../screen_models/Controller/user_preference.dart';


class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  final _controller = Get.put(StudentProfileScreenModel());
  UserPreferences userPreferences = UserPreferences();

  @override
  Widget build(BuildContext context) {
    final data = _controller.profile.value;

    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "${AppUrl.baseurl}${data.profilePicture}",
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(data.fullName.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Text(data.studentPhone.toString(),style: TextStyle(color: Colors.grey, )),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline_outlined),
            title: const Text('My Profile'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.edit_calendar_sharp),
            title: const Text('Edit Profile'),
            onTap: () {
              Navigator.pop(context);
              Get.toNamed(RouteName.studentEditProfileScreen);
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_alt_outlined),
            title: const Text('My Offer'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline_rounded),
            title: const Text('Post Tutor'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 10),
          SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Change Password '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Confirm Logout'),
                  content: Text('Are you sure you want to log out?'),
                  actions: [
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () => Navigator.pop(context),
                    ),
                    TextButton(
                      child: Text('Logout'),
                      onPressed: () {
                        Navigator.pop(context); // Close dialog
                        userPreferences.removeUser().then((value) {
                          Get.offAllNamed(RouteName.loginScreen);
                        }).onError((error, stackTrace) {
                          Utils.snackBar("Log Out", "Some Error: $error");
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

