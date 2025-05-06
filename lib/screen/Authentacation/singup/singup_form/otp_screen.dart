// lib/view/otp_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/resources/assets/image_assets.dart';
import 'package:tutorapp/resources/components/round_button.dart';

import '../../../../screen_models/Controller/singup/otp_screen_model.dart';


class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final _otpController = Get.put(OtpScreenModel());

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
                          controller: _otpController.getOtpController(index),
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
                Obx(() => _otpController.loading.value
                    ? const CircularProgressIndicator()
                    : RoundButton(
                  width: double.infinity,
                  title: "Verify",
                  onPress: _otpController.verifyOtp,
                )),
                TextButton(
                  onPressed: _otpController.resendOtp,
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
