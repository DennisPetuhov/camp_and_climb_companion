import 'package:dio/dio.dart';

import '../../constants/overpass_queries.dart';
import '../api/overpass/overpass_api.dart';
import '../config/dio_factory.dart';
import '../config/network_config.dart';
import '../dto/overpass/overpass_response.dart';

/// Entry point for Overpass API calls.
class OverpassClient {
  OverpassClient({Dio? dio, NetworkConfig? config})
    : _api = OverpassApi(
        dio ?? DioFactory.create(config: config ?? NetworkConfig.defaults),
      );

  final OverpassApi _api;

  OverpassApi get api => _api;

  Future<OverpassResponse> fetchTbilisiDrinkingWater() {
    return _api.query(OverpassQueries.tbilisiDrinkingWater);
  }
}