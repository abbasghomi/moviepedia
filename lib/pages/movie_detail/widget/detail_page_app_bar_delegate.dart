import 'package:flutter/material.dart';
import 'package:moviepedia/common/app/app_dependency_injection.dart';
import 'package:moviepedia/common/helpers/appearance_helper.dart';
import 'package:moviepedia/pages/movie_detail/widget/app_bar.dart';
import 'package:moviepedia/pages/movie_detail/widget/movie_poster.dart';
import 'package:moviepedia/pages/movie_detail/widget/movie_score.dart';

class DetailPageAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String movieTitle;
  final String? moviePosterUrl;
  final double voteAverage;

  DetailPageAppBarDelegate({
    required this.expandedHeight,
    required this.movieTitle,
    this.moviePosterUrl,
    required this.voteAverage,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = 75;
    final top = expandedHeight - shrinkOffset - size / 2;

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        MoviePoster(
          shrinkOffset: shrinkOffset,
          imageUrl: moviePosterUrl,
          movieTitle: movieTitle,
          expandedHeight: expandedHeight,
        ),
        DetailAppBar(
          shrinkOffset: shrinkOffset,
          expandedHeight: expandedHeight,
          movieTitle: movieTitle,
        ),
        Positioned(
          top: 10,
          left: 20,
          child: Opacity(
            opacity: locator<AppearanceHelper>()
                .disappear(shrinkOffset, expandedHeight),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.black54,
              ),
              alignment: Alignment.center,
              child: IconButton(
                alignment: Alignment.center,
                iconSize: 25.0,
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25.0,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ),
        Positioned(
          top: top,
          left: 40,
          child: MovieScore(
            shrinkOffset: shrinkOffset,
            voteAverage: voteAverage,
            expandedHeight: expandedHeight,
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
