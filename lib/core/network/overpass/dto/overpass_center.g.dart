// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overpass_center.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverpassCenter _$OverpassCenterFromJson(Map<String, dynamic> json) =>
    OverpassCenter(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$OverpassCenterToJson(OverpassCenter instance) =>
    <String, dynamic>{'lat': instance.lat, 'lon': instance.lon};
