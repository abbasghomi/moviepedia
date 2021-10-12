import 'package:moviepedia/common/constants/urls.dart';
import 'package:moviepedia/common/models/movie/movie_response_model.dart';
import 'package:moviepedia/common/models/search/keyword/search_keyword_response_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'search_apis.g.dart';

@RestApi(baseUrl: Urls.apiSearchUrl)
abstract class SearchRestClient {
  factory SearchRestClient(Dio dio, {String baseUrl}) = _SearchRestClient;

  @GET('/movie')
  Future<MovieResponseModel> searchByMovie(
    @Query('query') String query,
    @Query('include_adult') bool includeAdult,
    @Query('page') int page,
  );

  @GET('/keyword')
  Future<SearchKeywordResponseModel> searchByKeyword(
    @Query('query') String query,
    @Query('page') int page,
  );
}
