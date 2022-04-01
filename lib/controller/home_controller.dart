import 'package:get/state_manager.dart';
import 'package:university_services_app/repository/home_repo.dart';

import '../model/ads.dart';
import '../shared/component.dart';

class HomeController extends GetxController {
  final Rx<bool> loading = false.obs;
  final repo = HomeRepo();
  RxList<Ads> ads = <Ads>[].obs;
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void onInit() {
    getAds();
    print('asdasdasdasd');
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getAds() async {
    print('ajdhbahbdahjsbdsajhbd');
    try {
      loading(true);
      final res = await repo.getAds();
      if (res.status == 200 || res.status == 201) {
        ads(res.ads);
      }
      print(ads.toList());
      loading(false);
    } catch (e) {
      loading(false);
      print(e.toString());
      showErrorSnackBar('Some thing went wrong!');
    }
  }
}
