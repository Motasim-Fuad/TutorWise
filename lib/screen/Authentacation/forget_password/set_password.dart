import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/resources/assets/image_assets.dart';
import 'package:tutorapp/screen/Authentacation/singup/singup_form/otp_screen.dart';
import 'package:tutorapp/screen_models/Controller/forgetPassword/set_password_screen_model.dart';

import '../../../resources/components/round_button.dart';
import '../../../utils/utils.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  final _set_password_controller =Get.put(SetPasswordScreenModel());
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
              Text("Reset Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              SizedBox(height: 20,),
              TextFormField(
                controller: _set_password_controller.password_reset1.value,
                focusNode: _set_password_controller.fn_password_reset1.value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter password";
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(context, _set_password_controller.fn_password_reset1.value, _set_password_controller.fn_password_reset2.value);
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "New Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: _set_password_controller.password_reset2.value,
                focusNode: _set_password_controller.fn_password_reset2.value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter password";
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Re-Type Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              SizedBox(height: 20,),

              RoundButton(
                title: "Send",
                width: double.infinity,
                loading: _set_password_controller.loading.value,
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    _set_password_controller.resetPassword();
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
