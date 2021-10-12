import 'package:flutter/material.dart';
import 'package:moviepedia/common/models/movie/result.dart';
import 'package:moviepedia/pages/movie_detail/widget/detail_page_app_bar_delegate.dart';
import 'package:moviepedia/pages/movie_detail/widget/movie_overview.dart';

class MovieDetailPage extends StatelessWidget {
  final Result movieItem;

  MovieDetailPage({Key? key, required this.movieItem}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: DetailPageAppBarDelegate(
                  expandedHeight: MediaQuery.of(context).size.height * 80 / 100,
                  movieTitle: movieItem.title,
                  moviePosterUrl: movieItem.posterPath,
                  voteAverage: movieItem.voteAverage),
              pinned: true,
            ),
            MovieOverview(overview: movieItem.overview),
          ],
        ),
      );
}
