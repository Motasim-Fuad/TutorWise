import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tutorapp/resources/assets/image_assets.dart';
import 'package:tutorapp/screen_models/Controller/forgetPassword/forget_password_screen_model.dart';

import '../../../resources/components/round_button.dart';

class  ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _forgetpassScM =Get.put(ForgetPasswordScreenModel());

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Image(image: AssetImage(ImageAssets.logo)),
              SizedBox(height: 50,),
              Text("Forget Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              SizedBox(height: 20,),
              TextFormField(
                controller: _forgetpassScM.phoneController.value,

                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter Phone Number";
                  }
                  return null;
                },

                decoration: InputDecoration(
                  hintText: "Enter your Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              RoundButton(
                title: "Send",
                width: double.infinity,
                loading: _forgetpassScM.loading.value,
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                  _forgetpassScM.sendOtpForReset();
                  }
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
