import 'dart:convert';

import 'package:camp_and_climb_companion/core/network/openbeta/client/openbeta_client.dart';
import 'package:camp_and_climb_companion/features/openbeta/domain/repositories/openbeta_repository.dart';

class OpenBetaRepositoryImpl implements OpenBetaRepository {
  OpenBetaRepositoryImpl({required OpenBetaClient client}) : _client = client;

  final OpenBetaClient _client;

  @override
  Future<({int jsonCharCount, int areaCount})> fetchRoshkaRegionStats() async {
    final dtos = await _client.fetchRoshkaRegion();
    final jsonString = const JsonEncoder.withIndent(' ').convert({
      'cragsWithin': dtos.map((dto) => dto.toJson()).toList(),
    });
    return (jsonCharCount: jsonString.length, areaCount: dtos.length);
  }
}