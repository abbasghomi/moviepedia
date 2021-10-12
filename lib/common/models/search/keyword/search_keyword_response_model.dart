import 'package:json_annotation/json_annotation.dart';
import 'package:moviepedia/common/models/search/keyword/result.dart';

part 'search_keyword_response_model.g.dart';

@JsonSerializable()
class SearchKeywordResponseModel {
  int page;
  List<Result> results;
  @JsonKey(name: 'total_pages')
  int totalPages;
  @JsonKey(name: 'total_results')
  int totalResults;

  SearchKeywordResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchKeywordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SearchKeywordResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchKeywordResponseModelToJson(this);
}
