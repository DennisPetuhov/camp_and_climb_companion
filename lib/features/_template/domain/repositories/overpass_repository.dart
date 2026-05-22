import '../../../../core/network/dto/overpass/overpass_response.dart';

abstract class OverpassRepository {
  Future<OverpassResponse> fetchTbilisiDrinkingWater();
}