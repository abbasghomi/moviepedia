import 'package:equatable/equatable.dart';
import 'package:moviepedia/common/models/movie/movie_response_model.dart';

abstract class PopularMoviesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitState extends PopularMoviesState {}

class BusyState extends PopularMoviesState {}

class ClearListState extends PopularMoviesState {}

class DataReceivedState extends PopularMoviesState {
  final MovieResponseModel result;

  DataReceivedState({required this.result});
}

class ErrorState extends PopularMoviesState {
  final int? statusCode;
  final String? message;

  ErrorState({required this.statusCode, required this.message});
}
