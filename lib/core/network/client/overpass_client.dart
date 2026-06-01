import 'package:dio/dio.dart';

import '../../constants/overpass_queries.dart';
import '../api/overpass/overpass_api.dart';
import '../config/dio_factory.dart';
import '../config/network_config.dart';
import '../dto/overpass/overpass_response.dart';

/// Entry point for Overpass API calls.
class OverpassClient {
  OverpassClient({required NetworkConfig config, Dio? dio})
    : _api = OverpassApi(
        dio ?? DioFactory.create(config: config),
        baseUrl: config.overpassBaseUrl,
      );

  final OverpassApi _api;

  OverpassApi get api => _api;

  Future<OverpassResponse> fetchTbilisiDrinkingWater() {
    return _api.query(OverpassQueries.tbilisiDrinkingWater);
  }
}