// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openbeta_area_metadata_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenBetaAreaMetadataDto _$OpenBetaAreaMetadataDtoFromJson(
  Map<String, dynamic> json,
) => OpenBetaAreaMetadataDto(
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
  leaf: json['leaf'] as bool?,
  isBoulder: json['isBoulder'] as bool?,
);

Map<String, dynamic> _$OpenBetaAreaMetadataDtoToJson(
  OpenBetaAreaMetadataDto instance,
) => <String, dynamic>{
  'lat': instance.lat,
  'lng': instance.lng,
  'leaf': instance.leaf,
  'isBoulder': instance.isBoulder,
};
