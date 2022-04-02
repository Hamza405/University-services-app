import 'package:dio/dio.dart';

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
}
