import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

/// WGS84 latitude/longitude pair for map pins and geo logic.
@immutable
class LatLon extends Equatable {
  const LatLon({required this.lat, required this.lon});

  final double lat;
  final double lon;

  @override
  List<Object?> get props => [lat, lon];
}
