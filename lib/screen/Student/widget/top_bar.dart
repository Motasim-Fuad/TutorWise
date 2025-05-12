import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tutorapp/resources/routes/route_name.dart';
import '../../../resources/assets/image_assets.dart';
import '../../../screen_models/Controller/Student/StudentProfileScreenModel.dart';
import '../../../screen_models/Controller/localization_controller.dart';



class TopBar extends StatelessWidget {
  final String title;
  final Widget? trailing;

  TopBar({super.key, required this.title, this.trailing});

  final LocalizationController _localizationController = Get.put(
    LocalizationController(),
  );

  final _controller = Get.put(StudentProfileScreenModel());

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.grey[900] : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Builder(
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: isDarkMode ? Colors.black26 : Colors.black12,
              blurRadius: 4,
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(ImageAssets.appIcon),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              trailing ??
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.toNamed(RouteName.stNotificationScreen);
                        },
                        icon: Icon(Icons.notifications_outlined, color: textColor),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.toNamed(RouteName.stPostTuitionScreen);
                        },
                        icon: Icon(Icons.add_circle_outline_rounded, color: textColor),
                      ),
                      Obx(
                            () => GestureDetector(
                          onTap: _localizationController.flagChange,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              _localizationController.language.value
                                  ? ImageAssets.flagus
                                  : ImageAssets.flagbd,
                            ),
                            radius: 11,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.menu, color: textColor),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

