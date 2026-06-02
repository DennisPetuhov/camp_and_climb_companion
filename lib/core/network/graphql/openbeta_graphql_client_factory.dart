import 'package:graphql/client.dart';

import '../config/network_config.dart';

abstract final class OpenBetaGraphqlClientFactory {
  static GraphQLClient create(NetworkConfig networkConfig) {
    final link = HttpLink(
      networkConfig.openBetaGraphUrl,
      defaultHeaders: {
        'Accept': 'application/json',
        'User-Agent': networkConfig.userAgent,
      },
    );
    return GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }
}