/// OpenBeta bbox format: [west, south, east, north].

class GeoBbox {
  const GeoBbox({
    required this.minLng,
    required this.minLat,
    required this.maxLng,
    required this.maxLat,
  });

  final double minLng;
  final double minLat;
  final double maxLng;
  final double maxLat;

  List<double> toOpenBetaList() => [minLng, minLat, maxLng, maxLat];

  /// Box around Roshka (42.0, 43.5) — ~50 km each direction.
  static const roshkaRegion = GeoBbox(
    minLng: 43.0,
    minLat: 41.5,
    maxLng: 44.0,
    maxLat: 42.5,
  );
  ///  Tbilisi Overpass box.
  static const tbilisi = GeoBbox(
    minLng: 44.71,
    minLat: 41.62,
    maxLng: 44.96,
    maxLat: 41.85,
  );
}