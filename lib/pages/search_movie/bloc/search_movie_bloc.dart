import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:moviepedia/common/app/app_dependency_injection.dart';
import 'package:moviepedia/common/models/movie/movie_response_model.dart';
import 'package:moviepedia/common/services/search_service.dart';

import 'search_movie_event.dart';
import 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  SearchMovieBloc() : super(InitState());

  int page = 1;
  int totalPage = 1;
  String lastSearch = '';

  @override
  Stream<SearchMovieState> mapEventToState(SearchMovieEvent event) async* {
    if (event is InitSearchEvent) {
      yield InitState();
    } else if (event is SearchEvent) {
      yield BusyState();
      if (event.search.isEmpty) {
        yield ClearListState();
      } else {
        lastSearch = event.search;
        var result = await locator<SearchService>()
            .searchMovies(event.search, false, event.page);

        if (result is MovieResponseModel && result.results != null) {
          totalPage = result.totalPages;
          yield DataReceivedState(result: result);
        } else if (result != null && (result as Response?) != null) {
          print((result as Response).statusCode);
          yield ErrorState(
            statusCode: (result).statusCode,
            message: (result).statusMessage,
          );
        } else if (result == null) {
          yield ErrorState(
            statusCode: -1,
            message: 'Connection error!',
          );
        } else {
          yield ClearListState();
        }
      }
    } else if (event is FetchNextPageEvent) {
      if (page < totalPage) {
        page++;
        print(page);
        yield BusyState();
        var result = await locator<SearchService>()
            .searchMovies(lastSearch, false, page);

        if (result is MovieResponseModel && result.results != null) {
          totalPage = result.totalPages;
          yield DataReceivedState(result: result);
        } else if (result != null && (result as Response?) != null) {
          print((result as Response).statusCode);
          yield ErrorState(
            statusCode: (result).statusCode,
            message: (result).statusMessage,
          );
        } else if (result == null) {
          yield ErrorState(
            statusCode: -1,
            message: 'Connection error!',
          );
        } else {
          yield ClearListState();
        }
      }
    }
  }
}
