import 'package:json_annotation/json_annotation.dart';

import 'overpass_element.dart';

part 'overpass_response.g.dart';

@JsonSerializable()
class OverpassResponse {
  const OverpassResponse({
    required this.version,
    this.generator,
    required this.elements,
  });

  final double version;
  final String? generator;
  final List<OverpassElement> elements;

  factory OverpassResponse.fromJson(Map<String, dynamic> json) =>
      _$OverpassResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OverpassResponseToJson(this);
}