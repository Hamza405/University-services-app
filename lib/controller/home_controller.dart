import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:university_services_app/repository/home_repo.dart';

import '../model/ads.dart';
import '../model/order.dart';
import '../model/service.dart';
import '../shared/component.dart';
import 'auth_controller.dart';

class HomeController extends GetxController {
  final auth = Get.find<AuthController>();
  final repo = HomeRepo();

  RxList<Ads> ads = <Ads>[].obs;
  RxList<Service> services = <Service>[].obs;
  RxList<Order> myOrder = <Order>[].obs;
  final Rx<String> appTitle = 'الرئيسية'.obs;
  final Rx<bool> loading = false.obs;
  final Rx<Service> selectedService = Service().obs;

  var tabIndex = 0.obs;
  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void onInit() {
    getAds();
    getServices();
    getOrder();
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
}
