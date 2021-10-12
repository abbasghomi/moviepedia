import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:moviepedia/common/app/app_dependency_injection.dart';
import 'package:moviepedia/common/models/movie/movie_response_model.dart';
import 'package:moviepedia/common/services/movie_service.dart';

import 'popular_movies_event.dart';
import 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMoviesBloc() : super(InitState());

  int page = 1;
  int totalPage = 1;

  @override
  Stream<PopularMoviesState> mapEventToState(PopularMoviesEvent event) async* {
    if (event is InitPopularEvent) {
      yield InitState();
      yield BusyState();

      var result = await locator<MovieService>().popularMovies(1);

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
    } else if (event is FetchNextPageEvent) {
      if (page < totalPage) {
        page++;
        print(page);
        yield BusyState();
        var result = await locator<MovieService>().popularMovies(1);

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
