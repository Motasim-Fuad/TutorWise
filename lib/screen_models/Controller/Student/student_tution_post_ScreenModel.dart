import 'package:get/get.dart';
import '../../../models/Student/st_show_tution_post_list_model.dart';
import '../../../repository/Student_DashBoard/st_show_tution_post_list_repository.dart';

class StudentTutionPostController extends GetxController {
  final _repository = TutionPostRepository();

  RxList<TutionPostItem> postList = <TutionPostItem>[].obs;
  RxBool isLoading = false.obs;
  RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  void fetchPosts() async {
    isLoading.value = true;
    try {
      final TutionPostResponse result = await _repository.fetchTutionPosts();
      postList.value = result.results;
      error.value = '';
      print("tution post data fatching errpr is:${error.value}");
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
