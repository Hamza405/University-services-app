import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:university_services_app/model/order.dart';
import 'package:university_services_app/model/service.dart';
import 'package:university_services_app/model/study_program.dart';
import 'package:university_services_app/model/subject.dart';

import '../model/ads.dart';

class HomeRepo {
  final _dio = Get.find<Dio>();

  Future<AdsModel> getAds(String token) async {
    try {
      final response = await _dio.get('ads',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return AdsModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<ServiceModel> getServices(String token) async {
    try {
      final response = await _dio.get('services',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return ServiceModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<SubjectModel> getSubjects(String token) async {
    try {
      final response = await _dio.get('getSubjects',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return SubjectModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<OrderModel> addOrder(int serviceId, String token) async {
    try {
      final response = await _dio.post('addOrder',
          data: {
            'serviceId': serviceId.toString(),
          },
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return OrderModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<OrderModel> getMyOrder(String token) async {
    try {
      final response = await _dio.get('getOrders',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return OrderModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<StudyProgramModel> getStudyProgram(String token) async {
    try {
      final response = await _dio.get('getStudyProgram',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return StudyProgramModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
