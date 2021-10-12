import 'package:dio/dio.dart';
import 'package:moviepedia/common/api/movie_apis.dart';
import 'package:moviepedia/common/api/search_apis.dart';
import 'package:moviepedia/common/configs/env_configs.dart';
import 'package:moviepedia/common/constants/urls.dart';

class ApiHandler {
  late final Dio dio;

  late final MovieRestClient movieClient;
  late final SearchRestClient searchClient;

  ApiHandler() {
    dio = Dio()
      ..options.headers['Content-Type'] = 'application/json'
      ..options.queryParameters['api_key'] = EnvConfigs.apiKey
      ..options.connectTimeout = 3000
      ..options.sendTimeout = 5000
      ..options.receiveTimeout = 7000;

    movieClient = MovieRestClient(dio, baseUrl: Urls.apiMovieUrl);
    searchClient = SearchRestClient(dio, baseUrl: Urls.apiSearchUrl);
  }
}
