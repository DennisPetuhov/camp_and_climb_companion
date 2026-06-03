import 'package:dio/dio.dart';

import '../dto/overpass_response.dart';

class OverpassApi {
  OverpassApi(this._dio);

  final Dio _dio;

  Future<OverpassResponse> query(String overpassQuery) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/interpreter',
      data: {'data': overpassQuery},
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    return OverpassResponse.fromJson(response.data!);
  }
}