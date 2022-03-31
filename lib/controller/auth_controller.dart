import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_services_app/shared/component.dart';

import '../model/user.dart';
import '../repository/auth_repo.dart';

class AuthController extends GetxController {
  final Rx<bool> loading = false.obs;
  final Rx<bool> isAuth = false.obs;
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

  Future<bool> logout() async {
    loading(true);
    try {
      final res = await repo.logout(token.value);
      if (res['status'] == 200 || res['status'] == 201) {
        isAuth(false);
        token('');
        loading(false);
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
}
