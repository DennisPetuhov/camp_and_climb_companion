import 'package:camp_and_climb_companion/core/network/overpass/client/overpass_client.dart';
import 'package:camp_and_climb_companion/core/network/overpass/dto/overpass_response.dart';
import 'package:camp_and_climb_companion/features/overpass/domain/repositories/overpass_repository.dart';

class OverpassRepositoryImpl implements OverpassRepository {
  OverpassRepositoryImpl({required OverpassClient client}) : _client = client;

  final OverpassClient _client;

  @override
  Future<OverpassResponse> fetchTbilisiDrinkingWater() {
    return _client.fetchTbilisiDrinkingWater();
  }
}
