import 'package:camp_and_climb_companion/core/models/lat_lon.dart';
import 'package:camp_and_climb_companion/core/network/openbeta/dto/openbeta_area_dto.dart';
import 'package:camp_and_climb_companion/features/openbeta/domain/entities/climbing_area.dart';

abstract final class OpenBetaAreaMapper {
  static ClimbingArea toDomain(OpenBetaAreaDto dto) {
    final meta = dto.metadata;

    LatLon? location;
    if (meta?.lat != null && meta?.lng != null) {
      location = LatLon(lat: meta!.lat!, lon: meta.lng!);
    }

    return ClimbingArea(
      uuid: dto.uuid,
      name: dto.areaName,
      totalClimbs: dto.totalClimbs ?? 0,
      pathTokens: dto.pathTokens,
      location: location,
      isLeaf: meta?.leaf,
    );
  }

  static List<ClimbingArea> toDomainList(List<OpenBetaAreaDto> dtos) =>
      dtos.map(toDomain).toList();
}