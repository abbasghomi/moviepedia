import 'package:dio/dio.dart';
import 'package:moviepedia/common/api/search_apis.dart';
import 'package:moviepedia/common/configs/env_configs.dart';
import 'package:moviepedia/common/models/movie/movie_response_model.dart';
import 'package:moviepedia/common/models/search/keyword/search_keyword_response_model.dart';
import 'package:test/test.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:moviepedia/common/constants/urls.dart';
import 'package:fluent_assertions/fluent_assertions.dart';

late MockWebServer _server;
late SearchRestClient _client;
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
    _client = SearchRestClient(dio, baseUrl: Urls.apiSearchUrl); //_server.url
  });

  tearDown(() {
    _server.shutdown();
  });

  Future<MovieResponseModel> searchByMovie() async {
    _server.enqueue(headers: {'Content-Type': 'application/json'});
    return await _client.searchByMovie('juras', false, 1);
  }

  test('test search by movie should return result', () async {
    final searchByMovieResult = await searchByMovie();

    searchByMovieResult.shouldNotBeNull();
  });

  Future<SearchKeywordResponseModel> searchByKeyword() async {
    _server.enqueue(headers: {'Content-Type': 'application/json'});
    return await _client.searchByKeyword('juras', 1);
  }

  test('test popular movies list to be not null', () async {
    var searchByKeywordResult = await searchByKeyword();

    searchByKeywordResult.shouldNotBeNull();
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
