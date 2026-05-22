/// Overpass QL query strings.
abstract final class OverpassQueries {
  /// Tbilisi bbox drinking water — south, west, north, east.
  static const String tbilisiDrinkingWater = '''
[out:json][timeout:25];
(
  node["amenity"="drinking_water"](41.62,44.71,41.85,44.96);
  way["amenity"="drinking_water"](41.62,44.71,41.85,44.96);
);
out center;
''';
}