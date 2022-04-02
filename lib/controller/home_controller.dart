import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:university_services_app/repository/home_repo.dart';

import '../model/ads.dart';
import '../shared/component.dart';
import 'auth_controller.dart';

class HomeController extends GetxController {
  final Rx<bool> loading = false.obs;
  final auth = Get.find<AuthController>();
  final Rx<String> appTitle = 'الرئيسية'.obs;
  final repo = HomeRepo();
  RxList<Ads> ads = <Ads>[].obs;
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void onInit() {
    getAds();
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
      showErrorSnackBar('Some thing went wrong!');
    }
  }
}
