import 'package:camp_and_climb_companion/core/network/graphql/geo_bbox.dart';
import 'package:camp_and_climb_companion/features/_template/domain/entities/climbing_area.dart';

import '../../../../core/network/client/openbeta _client.dart';
import '../../domain/repositories/openbeta_repository.dart';
import '../mappers/openbeta_area_mapper.dart';

class OpenBetaRepositoryImpl implements OpenBetaRepository {
  OpenBetaRepositoryImpl({required OpenBetaClient client}) : _client = client;

  final OpenBetaClient _client;

  @override
  Future<List<ClimbingArea>> fetchAreasInBox(
    GeoBbox bbox, {
    double zoom = 10,
  }) async {
    final dtos = await _client.fetchCragsWithin(bbox: bbox, zoom: zoom);
    return OpenBetaAreaMapper.toDomainList(dtos);
  }

  @override
  Future<List<ClimbingArea>> fetchRoshkaRegion() async {
    final dtos = await _client.fetchRoshkaRegion();
    return OpenBetaAreaMapper.toDomainList(dtos);
  }
}
