import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkConfig {
  const NetworkConfig({
    required this.overpassBaseUrl,
    required this.userAgent,
    required this.connectTimeout,
    required this.receiveTimeout,
  });

  factory NetworkConfig.fromEnv() {
    return NetworkConfig(
      overpassBaseUrl: dotenv.get(
        'OVERPASS_BASE_URL',
        fallback: 'https://overpass-api.de',
      ),
      userAgent: dotenv.get(
        'USER_AGENT',
        fallback: 'CampAndClimbCompanion/1.0 (Flutter; pet project)',
      ),
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 60),
    );
  }

  final String overpassBaseUrl;
  final String userAgent;
  final Duration connectTimeout;
  final Duration receiveTimeout;
}
