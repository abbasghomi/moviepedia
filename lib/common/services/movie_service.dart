import 'package:dio/dio.dart';
import 'package:moviepedia/common/app/app_dependency_injection.dart';
import 'package:moviepedia/common/helpers/api_handler.dart';
import 'package:moviepedia/common/helpers/log_handler.dart';

class MovieService {
  Future<Object?> popularMovies(int page) async {
    try {
      var result =
          await locator<ApiHandler>().movieClient.getPopularMovies(page);
      return result;
    } catch (exp) {
      switch (exp.runtimeType) {
        case DioError:
          final res = (exp as DioError).response;
          if (res != null) {
            locator<LogHandler>().logger.e(
                'Got error : ${res.statusCode ?? '-1'} -> ${res.statusMessage ?? 'Connection Error!'}');
          } else {
            locator<LogHandler>()
                .logger
                .e('Got error : -1 -> Connection Error!');
          }

          return res;
        default:
          return null;
      }
    }
  }
}
