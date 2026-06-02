import 'package:equatable/equatable.dart';

import '../../../../core/models/lat_lon.dart';

class ClimbingArea extends Equatable {
  const ClimbingArea({
    required this.uuid,
    required this.name,
    required this.totalClimbs,
    this.pathTokens,
    this.location,
    this.isLeaf,
  });

  final String uuid;
  final String name;
  final int totalClimbs;
  final List<String>? pathTokens;
  final LatLon? location;
  final bool? isLeaf;

  @override
  List<Object?> get props => [uuid, name, totalClimbs, pathTokens, location, isLeaf];
}