// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openbeta_area_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenBetaAreaDto _$OpenBetaAreaDtoFromJson(Map<String, dynamic> json) =>
    OpenBetaAreaDto(
      uuid: json['uuid'] as String,
      areaName: json['area_name'] as String,
      pathTokens: (json['pathTokens'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      totalClimbs: (json['totalClimbs'] as num?)?.toInt(),
      metadata: json['metadata'] == null
          ? null
          : OpenBetaAreaMetadataDto.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$OpenBetaAreaDtoToJson(OpenBetaAreaDto instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'area_name': instance.areaName,
      'pathTokens': instance.pathTokens,
      'totalClimbs': instance.totalClimbs,
      'metadata': instance.metadata,
    };
