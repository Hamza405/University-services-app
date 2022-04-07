import 'package:get/get.dart';
import 'package:university_services_app/controller/home_controller.dart';
import 'package:university_services_app/repository/marks_repo.dart';

import '../model/mark.dart';
import '../shared/component.dart';
import 'auth_controller.dart';

class MarksController extends GetxController {
  final Rx<bool> loading = false.obs;
  final auth = Get.find<AuthController>();
  final subjects = Get.find<HomeController>().subjects();
  final repo = MarksRepo();
  final Rx<bool> tab = false.obs;

  final RxList<Mark> marks = <Mark>[].obs;
  final RxList<Mark> marksOnly = <Mark>[].obs;

  @override
  void onInit() {
    getMarks();
    getMarksOnly();
    super.onInit();
  }

  Future<void> getMarks() async {
    try {
      loading(true);
      final res = await repo.getMarks(auth.token());
      if (res.status == 200 || res.status == 201 && res.error == null) {
        marks(res.marks);
        for (var mark in marks) {
          mark.subjectName = subjects
              .firstWhere((element) => element.id == mark.subjectId)
              .name;
        }
      } else {
        showErrorSnackBar(res.error.toString());
      }
      loading(false);
    } catch (e) {
      loading(false);
      print(e.toString());
      showErrorSnackBar('Some thing went wrong!');
    }
  }

  Future<void> getMarksOnly() async {
    try {
      loading(true);
      final res = await repo.getMarksOnly(auth.token());
      if (res.status == 200 || res.status == 201 && res.error == null) {
        marksOnly(res.marks);
        for (var mark in marks) {
          mark.subjectName = subjects
              .firstWhere((element) => element.id == mark.subjectId)
              .name;
        }
      } else {
        showErrorSnackBar(res.error.toString());
      }
      loading(false);
    } catch (e) {
      loading(false);
      print(e.toString());
      showErrorSnackBar('Some thing went wrong!');
    }
  }
}
