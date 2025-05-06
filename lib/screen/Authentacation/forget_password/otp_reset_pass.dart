
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/resources/assets/image_assets.dart';
import 'package:tutorapp/resources/components/round_button.dart';
import 'package:tutorapp/screen_models/Controller/forgetPassword/otp_reset_password_Screen_Model.dart';

class OtpResetPasswordScreen extends StatelessWidget {
  OtpResetPasswordScreen({super.key});

  final _otpResetPasswordController = Get.put(OtpResetPasswordScreenModel());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageAssets.logo, height: size.height * 0.15),
                const SizedBox(height: 40),
                const Text("O T P", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: TextField(
                          controller: _otpResetPasswordController.getOtpController(index),
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(counterText: '', border: InputBorder.none),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                const Text("OTP expires in 2 minutes"),
                const SizedBox(height: 80),
                Obx(() => _otpResetPasswordController.loading.value
                    ? const CircularProgressIndicator()
                    : RoundButton(
                  width: double.infinity,
                  title: "Verify",
                  onPress: _otpResetPasswordController.verifyOtpfp,
                )),
                TextButton(
                  onPressed: _otpResetPasswordController.resendOtpfp,
                  child: const Text("Resend OTP"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
