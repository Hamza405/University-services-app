import 'package:dio/dio.dart';
import 'package:university_services_app/model/mark.dart';

import '../shared/constance.dart';

class MarksRepo {
  final _dio = Dio();

  Future<MarkModel> getMarks(String token) async {
    try {
      final response = await _dio.get('${baseURL}getMarks',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return MarkModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<MarkModel> getMarksOnly(String token) async {
    try {
      final response = await _dio.get('${baseURL}getMarksOnly',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return MarkModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
