// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crags_within_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CragsWithinDataDto _$CragsWithinDataDtoFromJson(Map<String, dynamic> json) =>
    CragsWithinDataDto(
      cragsWithin: (json['cragsWithin'] as List<dynamic>?)
          ?.map((e) => OpenBetaAreaDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CragsWithinDataDtoToJson(CragsWithinDataDto instance) =>
    <String, dynamic>{'cragsWithin': instance.cragsWithin};
