import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class LocalStorageData extends GetxController {
  Future<UserModel?> get getUser async {
    try {
      UserModel userModel = await _getUserData();
      if (userModel == null) return null;
      return userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var value = prefs.getString('CASH_USER_DATA');
    return UserModel.fromJson(json.decode(value!));
  }

  setUserData(UserModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('CASH_USER_DATA', json.encode(model.toJson()));
  }

  void deleteUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
