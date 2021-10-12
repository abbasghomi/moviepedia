// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'belongs_to_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BelongsToCollection _$BelongsToCollectionFromJson(Map<String, dynamic> json) =>
    BelongsToCollection(
      backdrop_path: json['backdrop_path'] as String?,
      id: json['id'] as int,
      name: json['name'] as String,
      poster_path: json['poster_path'] as String,
    );

Map<String, dynamic> _$BelongsToCollectionToJson(
        BelongsToCollection instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdrop_path,
      'id': instance.id,
      'name': instance.name,
      'poster_path': instance.poster_path,
    };
