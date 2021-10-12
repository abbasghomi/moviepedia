// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movie_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMovieResponseModel _$SearchMovieResponseModelFromJson(
        Map<String, dynamic> json) =>
    SearchMovieResponseModel(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$SearchMovieResponseModelToJson(
        SearchMovieResponseModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
