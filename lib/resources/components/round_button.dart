
import 'package:flutter/material.dart';

import '../colors/app_color.dart';


class RoundButton extends StatelessWidget {
  RoundButton({Key? key,
    this.buttonColor=AppColor.primaryButtonColor,
    this.textColor=AppColor.textLight,
    required this.title,
    required this.onPress,
    this.width =60,
    this.height =50,
    this.loading=false,



  }) : super(key: key,);
  final bool loading;
  final String title;
  final double height,width;
  final VoidCallback onPress;
  final Color textColor,buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(20),

          ),
          child: loading?Center( child: CircularProgressIndicator(),):
          Center(
            child: Text(title,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),
          )
      ),
    );
  }
}
