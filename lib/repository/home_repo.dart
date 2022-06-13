import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:university_services_app/model/complaint_command.dart';
import 'package:university_services_app/model/order.dart';
import 'package:university_services_app/model/service.dart';
import 'package:university_services_app/model/study_program.dart';
import 'package:university_services_app/model/subject.dart';

import '../model/ads.dart';
import '../model/exam.dart';
import '../model/re_order.dart';

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

  Future<OrderModel> saveComplaint(
      ComplaintCommand command, String token) async {
    try {
      final response = await _dio.post('saveComplaint',
          data: command.toJson(),
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return OrderModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      print('adasdasd ${e.toString()}');
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

  Future<ReOrderModel> getMyReOrder(String token) async {
    try {
      final response = await _dio.get('getReOrder',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return ReOrderModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<ReOrderModel> addReOrder(int subjectId, String token) async {
    try {
      final response = await _dio.post('reOrder',
          data: {
            'subject': subjectId.toString(),
          },
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return ReOrderModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<ReOrderModel> pullReOrder(int id, String token) async {
    try {
      final response = await _dio.post('pullReOrder',
          data: {
            'id': id,
          },
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return ReOrderModel.fromJson(response.data as Map<String, dynamic>);
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

  Future<ExamModel> getExam(String token) async {
    try {
      final response = await _dio.get('getExam',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return ExamModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
