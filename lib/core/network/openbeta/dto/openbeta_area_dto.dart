import 'package:json_annotation/json_annotation.dart';

import 'openbeta_area_metadata_dto.dart';

part 'openbeta_area_dto.g.dart';

@JsonSerializable()
class OpenBetaAreaDto {
  const OpenBetaAreaDto({
    required this.uuid,
    required this.areaName,
    this.pathTokens,
    this.totalClimbs,
    this.metadata,
  });

  final String uuid;
  @JsonKey(name: 'area_name')
  final String areaName;
  final List<String>? pathTokens;
  final int? totalClimbs;
  final OpenBetaAreaMetadataDto? metadata;

  factory OpenBetaAreaDto.fromJson(Map<String, dynamic> json) =>
      _$OpenBetaAreaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OpenBetaAreaDtoToJson(this);
}