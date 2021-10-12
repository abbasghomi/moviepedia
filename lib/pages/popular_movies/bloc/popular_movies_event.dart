import 'package:equatable/equatable.dart';

abstract class PopularMoviesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitPopularEvent extends PopularMoviesEvent {}

class FetchNextPageEvent extends PopularMoviesEvent {}

class FetchPopularMoviesEvent extends PopularMoviesEvent {
  final int page;

  FetchPopularMoviesEvent({required this.page});
}
