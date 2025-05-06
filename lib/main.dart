import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:tutorapp/resources/getx_localization/languages.dart';
import 'package:tutorapp/resources/routes/route.dart';
import 'package:tutorapp/screen/splash/splash_screen.dart';
import 'package:tutorapp/screen_models/services/theme_screen_model.dart';
import 'package:tutorapp/theme/app_theme.dart';

import 'bindings/initial_bindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  InitialBindings().dependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

   MyApp({super.key});
  final ThemeScreenModel themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        GetMaterialApp(
          title: 'Tutor Wise',
          debugShowCheckedModeBanner: false,

          translations: Languages(),
          locale: Locale("en","US"),
          fallbackLocale: Locale("en","US"),

          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeController.theme,

          home: SplashScreen(),
          getPages: AppRoutes.appRoutes(),

        )
    );


  }
}




