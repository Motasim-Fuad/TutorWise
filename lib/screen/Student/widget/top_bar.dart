import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tutorapp/resources/routes/route_name.dart';
import '../../../resources/assets/image_assets.dart';
import '../../../screen_models/Controller/localization_controller.dart';



class TopBar extends StatelessWidget {
  final String title;
  final Widget? trailing;

  TopBar({super.key, required this.title, this.trailing});

  final LocalizationController _localizationController = Get.put(
    LocalizationController(),
  );

  @override
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder:
          (context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
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
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              trailing ??
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications),
                      ),
                      IconButton(
                        onPressed: () {

                          Get.toNamed(RouteName.stPostTuitionScreen);
                        },
                        icon: const Icon(Icons.add_circle_outline_rounded),
                      ),
                      Obx(
                            () => GestureDetector(
                          onTap: _localizationController.flagChange,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              _localizationController.language.value
                                  ?  ImageAssets.flagus
                                  : ImageAssets.flagbd
                            ),
                            radius: 11,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.menu),
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
