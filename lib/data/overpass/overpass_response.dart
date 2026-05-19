import 'dart:convert';

import 'overpass_element.dart';

class OverpassResponse {
  const OverpassResponse({
    required this.version,
    this.generator,
    required this.elements,
  });

  final double version;
  final String? generator;
  final List<OverpassElement> elements;

  factory OverpassResponse.fromJson(Map<String, dynamic> json) {
    return OverpassResponse(
      version: (json['version'] as num).toDouble(),
      generator: json['generator'] as String?,
      elements: (json['elements'] as List<dynamic>)
          .map((e) => OverpassElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory OverpassResponse.fromJsonString(String body) {
    return OverpassResponse.fromJson(jsonDecode(body) as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() => {
        'version': version,
        if (generator != null) 'generator': generator,
        'elements': elements.map((e) => e.toJson()).toList(),
      };
}
