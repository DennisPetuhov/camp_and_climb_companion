// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overpass_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverpassElement _$OverpassElementFromJson(Map<String, dynamic> json) =>
    OverpassElement(
      type: json['type'] as String,
      id: (json['id'] as num).toInt(),
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      center: json['center'] == null
          ? null
          : OverpassCenter.fromJson(json['center'] as Map<String, dynamic>),
      tags: json['tags'] == null
          ? {}
          : OverpassElement._tagsFromJson(json['tags']),
    );

Map<String, dynamic> _$OverpassElementToJson(OverpassElement instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'lat': instance.lat,
      'lon': instance.lon,
      'center': instance.center,
      'tags': instance.tags,
    };
