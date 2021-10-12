import 'package:equatable/equatable.dart';
import 'package:moviepedia/common/models/movie/movie_response_model.dart';

abstract class SearchMovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitState extends SearchMovieState {}

class BusyState extends SearchMovieState {}

class ClearListState extends SearchMovieState {}

class DataReceivedState extends SearchMovieState {
  final MovieResponseModel result;

  DataReceivedState({required this.result});
}

class ErrorState extends SearchMovieState {
  final int? statusCode;
  final String? message;

  ErrorState({required this.statusCode, required this.message});
}
