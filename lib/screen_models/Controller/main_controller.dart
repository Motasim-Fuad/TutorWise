import 'package:get/get.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;
  }


  String get title {
    switch (currentIndex.value) {
      case 0: return 'Home';
      case 1: return 'Jobs';
      case 2: return 'Activity';
      case 3: return 'Profile';
      default: return 'Tutor App';
    }
  }

}
