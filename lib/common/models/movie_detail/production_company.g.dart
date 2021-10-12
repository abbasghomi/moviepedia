// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) =>
    ProductionCompany(
      id: json['id'] as int,
      logo_path: json['logo_path'] as String?,
      name: json['name'] as String,
      origin_country: json['origin_country'] as String,
    );

Map<String, dynamic> _$ProductionCompanyToJson(ProductionCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logo_path,
      'name': instance.name,
      'origin_country': instance.origin_country,
    };
