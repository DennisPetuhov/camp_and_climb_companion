import 'overpass_center.dart';

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

  factory OverpassElement.fromJson(Map<String, dynamic> json) {
    final rawTags = json['tags'];
    return OverpassElement(
      type: json['type'] as String,
      id: json['id'] as int,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      center: json['center'] == null
          ? null
          : OverpassCenter.fromJson(json['center'] as Map<String, dynamic>),
      tags: rawTags == null
          ? {}
          : (rawTags as Map<String, dynamic>).map(
              (key, value) => MapEntry(key, value.toString()),
            ),
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'id': id,
        if (lat != null) 'lat': lat,
        if (lon != null) 'lon': lon,
        if (center != null) 'center': center!.toJson(),
        if (tags.isNotEmpty) 'tags': tags,
      };
}
