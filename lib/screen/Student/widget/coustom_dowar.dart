import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/utils/utils.dart';
import '../../../resources/routes/route_name.dart';
import '../../../screen_models/Controller/user_preference.dart';


class CustomDrawer extends StatelessWidget {
   CustomDrawer({super.key});
  UserPreferences userPreferences=UserPreferences();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.deepPurple),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/icons/tutorwiseAppIcon.jpg"),
                ),
                SizedBox(height: 10),
                Text('John Doe', style: TextStyle(color: Colors.white, fontSize: 18)),
                Text('john.doe@email.com', style: TextStyle(color: Colors.white70)),
              ],
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
          SizedBox(height: 10,),

          SizedBox(height: 20,),
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
              }

          ),
        ],
      ),
    );
  }
}
