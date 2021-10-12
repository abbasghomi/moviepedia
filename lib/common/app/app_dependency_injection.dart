import 'package:get_it/get_it.dart';
import 'package:moviepedia/common/helpers/api_handler.dart';
import 'package:moviepedia/common/helpers/appearance_helper.dart';
import 'package:moviepedia/common/helpers/log_handler.dart';
import 'package:moviepedia/common/services/movie_service.dart';
import 'package:moviepedia/common/services/search_service.dart';

final locator = GetIt.instance;

Future<void> setupGetItLocators() async {
  locator.registerSingleton(LogHandler());
  locator.registerSingleton(ApiHandler());
  locator.registerSingleton(AppearanceHelper());
  locator.registerSingleton(MovieService());
  locator.registerSingleton(SearchService());
}
