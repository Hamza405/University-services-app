import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class LocalStorageData extends GetxController {
  Future<User?> get getUser async {
    try {
      User user = await _getUserData();
      if (User == null) return null;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var value = prefs.getString('CASH_USER_DATA');
    return User.fromJson(json.decode(value!));
  }

  setUserData(User model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('CASH_USER_DATA', json.encode(model.toJson()));
  }

  void deleteUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
