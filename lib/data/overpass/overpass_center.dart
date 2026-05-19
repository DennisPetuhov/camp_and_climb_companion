class OverpassCenter {
  const OverpassCenter({
    required this.lat,
    required this.lon,
  });

  final double lat;
  final double lon;

  factory OverpassCenter.fromJson(Map<String, dynamic> json) {
    return OverpassCenter(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lon': lon,
      };
}
