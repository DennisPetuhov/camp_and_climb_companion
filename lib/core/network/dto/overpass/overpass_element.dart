import 'package:json_annotation/json_annotation.dart';

import 'overpass_center.dart';

part 'overpass_element.g.dart';

@JsonSerializable()
class OverpassElement {
  const OverpassElement({
    required this.type,
    required this.id,
    this.lat,
    this.lon,
    this.center,
    this.tags = const {},
  });

  final String type;
  final int id;
  final double? lat;
  final double? lon;
  final OverpassCenter? center;

  @JsonKey(fromJson: _tagsFromJson, defaultValue: <String, String>{})
  final Map<String, String> tags;

  /// Lat/lon for map pins: direct on nodes, [center] on ways/relations.
  ({double lat, double lon})? get position {
    if (lat != null && lon != null) {
      return (lat: lat!, lon: lon!);
    }
    final c = center;
    if (c != null) {
      return (lat: c.lat, lon: c.lon);
    }
    return null;
  }

  factory OverpassElement.fromJson(Map<String, dynamic> json) =>
      _$OverpassElementFromJson(json);

  Map<String, dynamic> toJson() => _$OverpassElementToJson(this);

  static Map<String, String> _tagsFromJson(Object? json) {
    if (json is! Map) {
      return {};
    }
    return json.map(
      (key, value) => MapEntry(key.toString(), value.toString()),
    );
  }
}
