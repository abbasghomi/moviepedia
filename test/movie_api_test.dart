import 'package:dio/dio.dart';
import 'package:moviepedia/common/api/movie_apis.dart';
import 'package:moviepedia/common/configs/env_configs.dart';
import 'package:moviepedia/common/models/movie/movie_response_model.dart';
import 'package:test/test.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:moviepedia/common/constants/urls.dart';
import 'package:moviepedia/common/models/movie_detail/movie_detail_request_model.dart';
import 'package:fluent_assertions/fluent_assertions.dart';

late MockWebServer _server;
late MovieRestClient _client;
final _headers = {'Content-Type': 'application/json'};
final dispatcherMap = <String, MockResponse>{};

Future<void> main() async {
  setUp(() async {
    // TestWidgetsFlutterBinding.ensureInitialized();
    _server = MockWebServer();
    // _server.dispatcher = (HttpRequest request) async {
    //   var res = dispatcherMap[request.uri.path];
    //   if (res != null) {
    //     return res;
    //   }
    //   return new MockResponse()..httpCode = 404;
    // };
    await _server.start();
    final dio = Dio();
    dio.options.headers = _headers;
    dio.options.queryParameters['api_key'] = EnvConfigs.apiKey;

    dio.interceptors.add(LogInterceptor(responseBody: true));
    dio.interceptors.add(DateTimeInterceptor());
    _client = MovieRestClient(dio, baseUrl: Urls.apiMovieUrl); //_server.url
  });

  tearDown(() {
    _server.shutdown();
  });

  Future<MovieDetailRequestModel> getMovieDetail() async {
    _server.enqueue(headers: {'Content-Type': 'application/json'});
    return await _client.getMovieDetail(
      550988,
    );
  }

  test('test movie detail', () async {
    final movieDetail = await getMovieDetail();

    movieDetail.shouldNotBeNull();
  });

  Future<MovieResponseModel> getPopularMoviesList() async {
    _server.enqueue(headers: {'Content-Type': 'application/json'});
    return await _client.getPopularMovies(
      1,
    );
  }

  test('test popular movies list to be not null', () async {
    var popularMovies = await getPopularMoviesList();

    popularMovies.shouldNotBeNull();
  });
}

class DateTimeInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters = options.queryParameters.map((key, value) {
      if (value is DateTime) {
        //may be change to string from any you use object
        return MapEntry(key, value.toString());
      } else {
        return MapEntry(key, value);
      }
    });
    handler.next(options);
  }
}
