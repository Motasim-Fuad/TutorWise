import 'package:get/get.dart';

import '../../../repository/Student_DashBoard/st_profile_progressbar_repository.dart';


class StudentProfileScreenModel extends GetxController {
  final _repo = StProfileProgressbarRepository();

  var completion = 0.obs;
  var isLoading = false.obs;

  void fetchProfileProgress() async {
    isLoading.value = true;
    try {
      final model = await _repo.fetchProfileProgress();
      completion.value = model.completion;
    } catch (e) {
      print("Error loading profile progress: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchProfileProgress();
  }
}
