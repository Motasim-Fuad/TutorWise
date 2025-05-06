import 'package:get/get.dart';
import 'package:tutorapp/screen_models/services/theme_screen_model.dart';

import '../screen_models/Controller/main_controller.dart';


class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeScreenModel());
    Get.put(MainController());
  }


}
