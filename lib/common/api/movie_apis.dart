import 'package:moviepedia/common/constants/urls.dart';
import 'package:moviepedia/common/models/movie/movie_response_model.dart';
import 'package:moviepedia/common/models/movie_detail/movie_detail_request_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'movie_apis.g.dart';

@RestApi(baseUrl: Urls.apiMovieUrl)
abstract class MovieRestClient {
  factory MovieRestClient(Dio dio, {String baseUrl}) = _MovieRestClient;

  @GET('/popular')
  Future<MovieResponseModel> getPopularMovies(
    @Query('page') int page,
  );

  @GET('/{movieid}')
  Future<MovieDetailRequestModel> getMovieDetail(
    @Path() int movieid,
  );


}
