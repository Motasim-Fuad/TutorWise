
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors/app_color.dart';

class GeneralExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const GeneralExceptionWidget({Key? key,required this.onPress}) : super(key: key);

  @override
  State<GeneralExceptionWidget> createState() => _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Icon(Icons.warning_rounded,color: AppColor.primary,),
          Text("GeneralExceptation".tr),

          GestureDetector(
            onTap:widget.onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                color: AppColor.secondary,
                borderRadius:BorderRadius.circular(20),
              ),
              child: Center(
                child: Text("Retry",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),),
              ),
            ),
          )

        ],
      ),
    );
  }
}
