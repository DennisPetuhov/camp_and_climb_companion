import 'package:dio/dio.dart';

import 'network_config.dart';

/// Creates configured [Dio] instances for Retrofit APIs.
class DioFactory {
  const DioFactory._();

  static Dio create({required NetworkConfig config}) {
    return Dio(
      BaseOptions(
        connectTimeout: config.connectTimeout,
        receiveTimeout: config.receiveTimeout,
        headers: {
          'User-Agent': config.userAgent,
        },
      ),
    );
  }
}