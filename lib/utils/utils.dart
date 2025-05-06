

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';



class Utils{

  // jodi email,pass dui ta field thaka toba focush change korar method

  static void fieldFocusChange(BuildContext context,
      FocusNode current, FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }


  // toastMassage method
  static toastMassage(String massage){
    Fluttertoast.showToast(
        msg: massage,
        backgroundColor: Colors.red,
        gravity: ToastGravity.BOTTOM
    );
  }

  static toastMassageCenter(String massage){
    Fluttertoast.showToast(
        msg: massage,
        backgroundColor: Colors.red,
        gravity: ToastGravity.CENTER
    );
  }



  static snackBar(String title,String message){
    Get.snackbar(
      title,
      message,
    );
  }

}