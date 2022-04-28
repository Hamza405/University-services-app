import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../model/user.dart';

class AuthRepo {
  final _dio = Get.find<Dio>();

  Future<UserModel> login(email, password) async {
    try {
      final res = await _dio
          .post('login', data: {'email': email, 'password': password});
      return UserModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signup(AuthCommand command) async {
    try {
      final res = await _dio.post('signup', data: command.toJson());
      return UserModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> logout(String token) async {
    try {
      final res = await _dio.get('user/revoke',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return res.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserData(String token) async {
    try {
      final res = await _dio.get('getUser',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return UserModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
