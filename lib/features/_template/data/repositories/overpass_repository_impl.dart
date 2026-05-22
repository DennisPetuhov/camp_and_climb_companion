import 'package:camp_and_climb_companion/core/network/dto/overpass/overpass_response.dart';
import 'package:camp_and_climb_companion/features/_template/domain/repositories/overpass_repository.dart';

import '../../../../core/network/client/overpass_client.dart';

class OverPassRepositoryImpl implements OverpassRepository {
  OverPassRepositoryImpl({OverpassClient? client})
    : _client = client ?? OverpassClient();

  final OverpassClient _client;

  @override
  Future<OverpassResponse> fetchTbilisiDrinkingWater() {
    return _client.fetchTbilisiDrinkingWater();
  }
}