import 'package:get/get.dart';

class SignUpSelectionController extends GetxController {
  var selectedIndex = 0.obs;

  void selectRole(int index) {
    selectedIndex.value = index;
  }
}
