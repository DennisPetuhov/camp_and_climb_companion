import 'package:json_annotation/json_annotation.dart';

part 'openbeta_area_metadata_dto.g.dart';

@JsonSerializable()
class OpenBetaAreaMetadataDto {
  const OpenBetaAreaMetadataDto({
    this.lat,
    this.lng,
    this.leaf,
    this.isBoulder,
  });

  final double? lat;
  final double? lng;
  final bool? leaf;
  final bool? isBoulder;

  factory OpenBetaAreaMetadataDto.fromJson(Map<String, dynamic> json) =>
      _$OpenBetaAreaMetadataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OpenBetaAreaMetadataDtoToJson(this);
}