import 'package:camp_and_climb_companion/core/models/geo_bbox.dart';
import 'package:camp_and_climb_companion/core/network/config/network_config.dart';
import 'package:camp_and_climb_companion/core/network/openbeta/dto/crags_within_data_dto.dart';
import 'package:camp_and_climb_companion/core/network/openbeta/dto/openbeta_area_dto.dart';
import 'package:camp_and_climb_companion/core/network/openbeta/openbeta_graphql_client_factory.dart';
import 'package:camp_and_climb_companion/core/network/openbeta/openbeta_queries.dart';
import 'package:graphql/client.dart';

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

  Future<List<OpenBetaAreaDto>> fetchRoshkaRegion() {
    return fetchCragsWithin(bbox: GeoBbox.roshkaRegion, zoom: 10);
  }
}
