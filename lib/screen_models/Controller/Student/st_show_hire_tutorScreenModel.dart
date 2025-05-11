import 'package:get/get.dart';
import 'package:tutorapp/repository/Student_DashBoard/st_show_hire_tutor_repository.dart';
import '../../../models/Student/Show_hireTutorInformationModel.dart';

class StShowHireTutorscreenmodel extends GetxController {
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;
  final RxList<HireTutorInformationModel> tutorList = <HireTutorInformationModel>[].obs;

  final _repository = HireTutorRepository();

  @override
  void onInit() {
    super.onInit();
    fetchTutors();
  }

  void fetchTutors() async {
    isLoading.value = true;
    error.value = '';

    try {
      final data = await _repository.fetchHireTutorList();
      tutorList.assignAll(data);


      print("screen mode  :$data");
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
