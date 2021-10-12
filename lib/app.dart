import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviepedia/common/configs/ui_configs.dart';
import 'package:moviepedia/pages/popular_movies/bloc/popular_movies_bloc.dart';
import 'package:moviepedia/pages/popular_movies/bloc/popular_movies_event.dart';
import 'package:moviepedia/pages/search_movie/bloc/search_movie_bloc.dart';
import 'package:moviepedia/pages/search_movie/bloc/search_movie_event.dart';
import 'package:moviepedia/pages/splash/splash_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              PopularMoviesBloc()..add(InitPopularEvent()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              SearchMovieBloc()..add(InitSearchEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter UI Challenge',
        theme: ThemeData(
          primarySwatch:
              MaterialColor(UiConfigs.primaryColor, UiConfigs.colorSwatch),
        ),
        home: SplashPage(),
      ),
    );
  }
}
