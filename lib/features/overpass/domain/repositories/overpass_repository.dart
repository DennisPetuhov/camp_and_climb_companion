import 'package:camp_and_climb_companion/core/network/overpass/dto/overpass_response.dart';

abstract class OverpassRepository {
  Future<OverpassResponse> fetchTbilisiDrinkingWater();
}
