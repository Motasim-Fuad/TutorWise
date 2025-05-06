import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/resources/assets/image_assets.dart';
import 'package:tutorapp/resources/components/round_button.dart';
import 'package:tutorapp/resources/routes/route_name.dart';
import 'package:tutorapp/screen_models/Controller/login_screen_model.dart';
import 'package:tutorapp/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginScM = Get.put(LoginScreenModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage(ImageAssets.logo)),
                SizedBox(height: 30,),
                Form(
                  key: _formKey,
                  child: Column(

                    children: [
                      TextFormField(
                        controller: _loginScM.phoneController.value,
                        focusNode: _loginScM.phoneFocusNode.value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter email/phone";
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          Utils.fieldFocusChange(context, _loginScM.phoneFocusNode.value, _loginScM.passwordFocusNode.value);
                        },
                        decoration: InputDecoration(
                          hintText: "Phone/Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _loginScM.passwordController.value,
                        focusNode: _loginScM.passwordFocusNode.value,
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
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),


                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx((){
                          return Checkbox(
                            value: _loginScM.rememberMe.value,
                            onChanged: _loginScM.toggleRememberMe,
                          );
                        }),
                        const  Text("Remember Me"),
                      ],
                    ),

                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteName.forgetpassScreen);
                      },
                      child: Text("Forget Password",style: TextStyle(color: Colors.blue),),
                    ),

                  ],
                ),
                const SizedBox(height: 20,),
                Obx(() => RoundButton(
                  title: "Login",
                  width: double.infinity,
                  loading: _loginScM.loading.value,
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      _loginScM.loginApi();
                    }
                  },
                )),



                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("if you don't have any account go to "),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteName.singupScreen);
                      },
                      child: Text("SingUp",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                SizedBox(height: 10,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
