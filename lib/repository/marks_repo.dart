import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:university_services_app/model/mark.dart';

class MarksRepo {
  final _dio = Get.find<Dio>();

  Future<MarkModel> getMarks(String token) async {
    try {
      final response = await _dio.get('getMarks',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return MarkModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<MarkModel> getMarksOnly(String token) async {
    try {
      final response = await _dio.get('getMarksOnly',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return MarkModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
