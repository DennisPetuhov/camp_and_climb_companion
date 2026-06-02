import 'package:json_annotation/json_annotation.dart';

import 'openbeta_area_dto.dart';

part 'crags_within_data_dto.g.dart';

@JsonSerializable()
class CragsWithinDataDto {
  const CragsWithinDataDto({this.cragsWithin});

  final List<OpenBetaAreaDto>? cragsWithin;

  factory CragsWithinDataDto.fromJson(Map<String, dynamic> json) =>
      _$CragsWithinDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CragsWithinDataDtoToJson(this);
}