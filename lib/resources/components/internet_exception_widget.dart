import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/resources/colors/app_color.dart';
import 'package:tutorapp/screen_models/services/theme_screen_model.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({Key? key, required this.onPress}) : super(key: key);

  @override
  State<InternetExceptionWidget> createState() => _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  final ThemeScreenModel themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.cloud_off, color: AppColor.primary),
          Text("internet_Exception".tr, style: textTheme.bodyLarge),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: widget.onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text("Retry", style: textTheme.bodyLarge?.copyWith(color: AppColor.textLight)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
