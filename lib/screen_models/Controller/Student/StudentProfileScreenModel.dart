import 'package:get/get.dart';
import 'package:tutorapp/repository/Student_DashBoard/st_profile_repository.dart';
import '../../../../models/Student/student_profile_model.dart';


class StudentProfileScreenModel extends GetxController {
  final _repository = StProfileRepository();

  var isLoading = true.obs;
  var profile = StudentProfileModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  void fetchProfile() async {
    try {
      isLoading(true);
      final data = await _repository.fetchProfileDetails();
      profile.value = data;
    } catch (e) {
      Get.snackbar("Error", "Failed to load profile");
    } finally {
      isLoading(false);
    }
  }
}
