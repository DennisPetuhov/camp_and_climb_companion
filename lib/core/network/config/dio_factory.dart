import 'package:dio/dio.dart';

import 'network_config.dart';

class DioFactory {
  const DioFactory._();

  static Dio create({
    required NetworkConfig config,
    String? baseUrl,
  }) {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl ?? '',
        connectTimeout: config.connectTimeout,
        receiveTimeout: config.receiveTimeout,
        headers: {
          'User-Agent': config.userAgent,
        },
      ),
    );
  }
}