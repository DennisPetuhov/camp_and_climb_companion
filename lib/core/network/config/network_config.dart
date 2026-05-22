class NetworkConfig {
  const NetworkConfig({
    required this.connectTimeout,
    required this.receiveTimeout,
  });

  static const String overpassBaseUrl = 'https://overpass-api.de';

  static const String userAgent =
      'CampAndClimbCompanion/1.0 (Flutter; pet project)';

  static const NetworkConfig defaults = NetworkConfig(
    connectTimeout: Duration(seconds: 30),
    receiveTimeout: Duration(seconds: 60),
  );

  final Duration connectTimeout;
  final Duration receiveTimeout;
}