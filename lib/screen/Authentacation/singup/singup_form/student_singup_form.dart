import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/screen_models/Controller/singup/singup_screen_model.dart';
import 'package:tutorapp/resources/components/round_button.dart';
import 'package:tutorapp/utils/utils.dart';

class StudentSingupForm extends StatelessWidget {
  StudentSingupForm({super.key});

  final _signUpScM = Get.find<SignUpScreenModel>();
  final _formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _signUpScM.emailController_si,
            focusNode: _signUpScM.emailFocusNode_si,
            validator: (value) =>
            value!.isEmpty ? "Please enter email" : null,
            onFieldSubmitted: (_) => Utils.fieldFocusChange(
              context,
              _signUpScM.emailFocusNode_si,
              _signUpScM.passwordFocusNode_si,
            ),
            decoration: const InputDecoration(
              hintText: "Student Email",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: phoneController,
            validator: (value) =>
            value!.isEmpty ? "Please enter phone number" : null,
            decoration: const InputDecoration(
              hintText: "Phone",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _signUpScM.passwordController_si,
            focusNode: _signUpScM.passwordFocusNode_si,
            validator: (value) =>
            value!.isEmpty ? "Please enter password" : null,
            obscureText: true,
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(),
            decoration: const InputDecoration(
              hintText: "Password",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: confirmPasswordController,
            validator: (value) {
              if (value!.isEmpty) return "Please confirm password";
              if (value != _signUpScM.passwordController_si.text)
                return "Passwords do not match";
              return null;
            },
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "Confirm Password",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Obx(() => RoundButton(
            title: "Sign Up as Student",
            width: double.infinity,
            loading: _signUpScM.loading.value,
            onPress: () {
              if (_formKey.currentState!.validate()) {
                final phoneWithCountryCode = "88${phoneController.text.trim()}";
                _signUpScM.signupApi(
                  userType: "student",
                  phone: phoneWithCountryCode,
                  username:
                  _signUpScM.emailController_si.text.trim(),
                  password: _signUpScM.passwordController_si.text,
                  confirmPassword: confirmPasswordController.text,
                );
                phoneController.clear();
                confirmPasswordController.clear();
              }
            },
          )),
        ],
      ),
    );
  }
}
