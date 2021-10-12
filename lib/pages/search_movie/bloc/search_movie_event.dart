import 'package:equatable/equatable.dart';

abstract class SearchMovieEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitSearchEvent extends SearchMovieEvent {}

class FetchNextPageEvent extends SearchMovieEvent {}

class SearchEvent extends SearchMovieEvent {
  final String search;
  final int page;

  SearchEvent({required this.search, required this.page});
}
