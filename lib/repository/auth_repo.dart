import 'package:dio/dio.dart';
import '../model/user.dart';
import '../shared/constance.dart';

class AuthRepo {
  final _dio = Dio();

  Future<UserModel> login(email, password) async {
    try {
      final res = await _dio.post('${baseURL}login',
          data: {'email': email, 'password': password});
      return UserModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signup(AuthCommand command) async {
    try {
      final res = await _dio.post('${baseURL}signup', data: command.toJson());
      return UserModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> logout(String token) async {
    try {
      final res = await _dio.get('${baseURL}user/revoke',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return res.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserData(String token) async {
    try {
      final res = await _dio.get('${baseURL}getUser',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return UserModel.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
