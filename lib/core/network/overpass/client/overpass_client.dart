import 'package:dio/dio.dart';

import '../../config/dio_factory.dart';
import '../../config/network_config.dart';
import '../api/overpass_api.dart';
import '../dto/overpass_response.dart';
import '../overpass_queries.dart';

class OverpassClient {
  OverpassClient({required NetworkConfig config, Dio? dio})
      : _api = OverpassApi(
          dio ??
              DioFactory.create(
                config: config,
                baseUrl: config.overpassBaseUrl,
              ),
        );

  final OverpassApi _api;

  Future<OverpassResponse> fetchTbilisiDrinkingWater() {
    return _api.query(OverpassQueries.tbilisiDrinkingWater);
  }
}
