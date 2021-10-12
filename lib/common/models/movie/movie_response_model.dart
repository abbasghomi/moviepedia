import 'package:json_annotation/json_annotation.dart';
import 'package:moviepedia/common/models/movie/result.dart';

part 'movie_response_model.g.dart';

@JsonSerializable()
class MovieResponseModel {
  int page;
  List<Result>? results;
  @JsonKey(name: 'total_pages')
  int totalPages;
  @JsonKey(name: 'total_results')
  int totalResults;

  MovieResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseModelToJson(this);
}
