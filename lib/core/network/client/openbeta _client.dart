import 'package:camp_and_climb_companion/core/constants/openbeta_queries.dart';
import 'package:graphql/client.dart';

import '../config/network_config.dart';
import '../dto/openbeta/crags_within_data_dto.dart';
import '../dto/openbeta/openbeta_area_dto.dart';
import '../graphql/geo_bbox.dart';
import '../graphql/openbeta_graphql_client_factory.dart';

class OpenBetaClient {
  OpenBetaClient({required NetworkConfig config})
    : _client = OpenBetaGraphqlClientFactory.create(config);

  final GraphQLClient _client;

  /// Load areas in [bbox]. [zoom] 10 = regions, 12 = leaf crags.
  Future<List<OpenBetaAreaDto>> fetchCragsWithin({
    required GeoBbox bbox,
    double zoom = 10,
  }) async {
    final result = await _client.query(
      QueryOptions(
        document: OpenBetaQueries.cragsWithin,
        variables: {
          'filter': {'bbox': bbox.toOpenBetaList(), 'zoom': zoom},
        },
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    final raw = result.data;
    if (raw == null) {
      throw StateError('OpenBeta returned empty data');
    }

    final dto = CragsWithinDataDto.fromJson(raw);
    return dto.cragsWithin ?? [];
  }

  /// Default demo: box around Roshka, parent-level areas.
  Future<List<OpenBetaAreaDto>> fetchRoshkaRegion() {
    return fetchCragsWithin(bbox: GeoBbox.roshkaRegion, zoom: 10);
  }
}
