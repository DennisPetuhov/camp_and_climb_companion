import 'package:camp_and_climb_companion/core/models/lat_lon.dart';
import 'package:json_annotation/json_annotation.dart';

part 'overpass_center.g.dart';

@JsonSerializable()
class OverpassCenter {
  const OverpassCenter({
    required this.lat,
    required this.lon,
  });

  final double lat;
  final double lon;

  LatLon get latLon => LatLon(lat: lat, lon: lon);

  factory OverpassCenter.fromJson(Map<String, dynamic> json) =>
      _$OverpassCenterFromJson(json);

  Map<String, dynamic> toJson() => _$OverpassCenterToJson(this);
}