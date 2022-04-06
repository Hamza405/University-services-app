import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_services_app/controller/home_controller.dart';
import 'package:university_services_app/shared/component.dart';
import 'package:university_services_app/shared/local_storage.dart';

import '../model/user.dart';
import '../repository/auth_repo.dart';
import '../shared/constance.dart';

class AuthController extends GetxController {
  final Rx<bool> loading = false.obs;
  final Rx<bool> isAuth = false.obs;
  final _storage = Get.find<LocalStorage>();
  final repo = AuthRepo();
  final Rx<String> token = ''.obs;
  var user = User().obs;

  Future<bool> login(email, password) async {
    loading(true);
    try {
      final res = await repo.login(email, password);
      if (res.status == 200 || res.status == 201 && res.error == null) {
        isAuth(true);
        token(res.token);
        user(res.user);
        _storage.saveData(tokenKey, res.token);
        loading(false);
        return true;
      }
      loading(false);
      showErrorSnackBar(res.error.toString());
      return false;
    } catch (e) {
      loading(false);
      showErrorSnackBar('Some thing went wrong!');
      return false;
    }
  }

  Future<bool> signup(AuthCommand command) async {
    loading(true);
    try {
      final res = await repo.signup(command);
      if (res.status == 200 || res.status == 201 && res.error == null) {
        isAuth(true);
        token(res.token);
        user(res.user);
        _storage.saveData(tokenKey, res.token);
        loading(false);
        return true;
      }
      loading(false);
      showErrorSnackBar(res.error.toString());
      return false;
    } catch (e) {
      loading(false);
      showErrorSnackBar('Some thing went wrong!');
      return false;
    }
  }

  Future<void> autoLogin() async {
    var tok = _storage.getData(tokenKey);
    if (tok != null) {
      var isLogin = await getUserData(tok);
      if (isLogin) {
        token(tok);
        isAuth(true);
      }
    }
  }

  Future<bool> logout() async {
    loading(true);
    try {
      final res = await repo.logout(token.value);
      if (res['status'] == 200 || res['status'] == 201) {
        isAuth(false);
        token('');
        _storage.deleteDataByKey(tokenKey);
        loading(false);
        Get.delete<HomeController>();
        return true;
      }
      loading(false);
      showErrorSnackBar('Some thing went wrong!');
      return false;
    } catch (e) {
      loading(false);
      showErrorSnackBar('Some thing went wrong!');
      return false;
    }
  }

  Future<bool> getUserData(token) async {
    try {
      final res = await repo.getUserData(token);
      if (res.status == 200 || res.status == 201 && res.error == null) {
        user(res.user);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
