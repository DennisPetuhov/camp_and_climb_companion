import 'package:camp_and_climb_companion/features/_template/domain/entities/climbing_area.dart';

import '../../../../core/network/graphql/geo_bbox.dart';

abstract class OpenBetaRepository {
  Future<List<ClimbingArea>> fetchAreasInBox(GeoBbox bbox, {double zoom = 10});

  Future<List<ClimbingArea>> fetchRoshkaRegion();
}
