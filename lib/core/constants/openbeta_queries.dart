import 'package:graphql/client.dart';

/// GraphQL documents for https://api.openbeta.io

abstract class OpenBetaQueries {
  // Areas inside a map rectangle.
  /// bbox = [west, south, east, north] = [minLng, minLat, maxLng, maxLat]
  /// zoom < 11 → parent regions (e.g. Roshka). zoom >= 11 → leaf crags.
  static final cragsWithin = gql(r'''
query CragsWithin($filter: SearchWithinFilter!) {
  cragsWithin(filter: $filter) {
    uuid
    area_name
    pathTokens
    totalClimbs
    metadata {
      lat
      lng
      leaf
      isBoulder
    }
  }
}
''');
}
