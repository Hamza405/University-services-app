import 'package:dio/dio.dart';
import 'package:university_services_app/model/order.dart';
import 'package:university_services_app/model/service.dart';

import '../model/ads.dart';
import '../shared/constance.dart';

class HomeRepo {
  final _dio = Dio();

  Future<AdsModel> getAds(String token) async {
    try {
      final response = await _dio.get('${baseURL}ads',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return AdsModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<ServiceModel> getServices(String token) async {
    try {
      final response = await _dio.get('${baseURL}services',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return ServiceModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<OrderModel> addOrder(int serviceId, String token) async {
    try {
      final response = await _dio.post('${baseURL}addOrder',
          data: {
            'serviceId': serviceId,
          },
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return OrderModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<OrderModel> getMyOrder(String token) async {
    try {
      final response = await _dio.get('${baseURL}getOrders',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return OrderModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
