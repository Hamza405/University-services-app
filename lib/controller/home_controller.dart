import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:university_services_app/model/complaint_command.dart';
import 'package:university_services_app/model/study_program.dart';
import 'package:university_services_app/model/subject.dart';
import 'package:university_services_app/repository/home_repo.dart';

import '../model/ads.dart';
import '../model/exam.dart';
import '../model/order.dart';
import '../model/re_order.dart';
import '../model/service.dart';
import '../shared/component.dart';
import 'auth_controller.dart';

class HomeController extends GetxController {
  final auth = Get.find<AuthController>();
  final repo = HomeRepo();

  RxList<Ads> ads = <Ads>[].obs;
  RxList<Subject> subjects = <Subject>[].obs;
  RxList<Service> services = <Service>[].obs;
  RxList<StudyProgram> studyProgram = <StudyProgram>[].obs;
  RxList<Order> myOrder = <Order>[].obs;
  RxList<ReOrder> myReOrder = <ReOrder>[].obs;

  final appTitle = 'الرئيسية'.obs;
  final loading = false.obs;
  final selectedService = Service().obs;
  final selectedSubject = Subject().obs;
  final selectedDay = StudyProgram().obs;
  final exam = Exam().obs;
  final complaintCommand = ComplaintCommand().obs;

  var tabIndex = 0.obs;
  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    getAds();
    getSubjects();
    getServices();
    getOrder();
    getStudyProgram();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getAds() async {
    try {
      loading(true);
      final res = await repo.getAds(auth.token());
      if (res.status == 200 || res.status == 201 && res.error == null) {
        ads(res.ads);
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

  Future<void> getStudyProgram() async {
    try {
      loading(true);
      final res = await repo.getStudyProgram(auth.token());
      if (res.status == 200 || res.status == 201 && res.error == null) {
        studyProgram(res.studyProgram);
        selectedDay(studyProgram.first);
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

  Future<void> getSubjects() async {
    try {
      loading(true);
      final res = await repo.getSubjects(auth.token());
      if (res.status == 200 || res.status == 201 && res.error == null) {
        subjects(res.subjects);
        selectedSubject(subjects.first);
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

  Future<void> getServices() async {
    try {
      loading(true);
      final res = await repo.getServices(auth.token());
      if (res.status == 200 || res.status == 201 && res.error == null) {
        services(res.services);
        selectedService(services.first);
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

  Future<void> addOrder(int? serviceId) async {
    try {
      loading(true);
      final res = await repo.addOrder(serviceId!, auth.token());
      if (res.status == 200 || res.status == 201 && res.error == null) {
        showOrderSuccess(res.order!);
        getOrder();
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

  Future<void> getOrder() async {
    try {
      loading(true);
      final res = await repo.getMyOrder(auth.token());
      if (res.status == 200 || res.status == 201 && res.error == null) {
        myOrder(res.myOrder);
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

  Future<void> getReOrder() async {
    try {
      loading(true);
      final res = await repo.getMyReOrder(auth.token());
      if (res.status == 200 || res.status == 201 && res.error == null) {
        myReOrder(res.myOrder);
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

  Future<void> addReOrder(int subjectId) async {
    try {
      loading(true);
      final res = await repo.addReOrder(subjectId, auth.token());
      if (res.status == 200 || res.status == 201 && res.error == null) {
        showOrderSuccess(Order(
            deadline: res.order!.deadline, created_at: res.order!.created_at));
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

  Future<void> saveComplaint() async {
    try {
      loading(true);
      final res = await repo.saveComplaint(complaintCommand(), auth.token());
      if (res.status == 200 || res.status == 201 && res.error == null) {
        showComplaintSuccess();
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

  Future<void> getExam() async {
    try {
      loading(true);
      final res = await repo.getExam(auth.token());
      if (res.status == 200 || res.status == 201 && res.error == null) {
        exam(res.exam);
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
