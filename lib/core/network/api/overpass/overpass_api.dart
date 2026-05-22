import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../config/network_config.dart';
import '../../dto/overpass/overpass_response.dart';

part 'overpass_api.g.dart';

@RestApi(baseUrl: NetworkConfig.overpassBaseUrl)
abstract class OverpassApi {
  factory OverpassApi(Dio dio, {String? baseUrl}) = _OverpassApi;

  @POST('/api/interpreter')
  @FormUrlEncoded()
  Future<OverpassResponse> query(@Field('data') String overpassQuery);
}