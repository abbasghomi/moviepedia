import 'package:flutter/material.dart';
import 'package:moviepedia/common/app/app_dependency_injection.dart';
import 'package:moviepedia/common/helpers/appearance_helper.dart';

class DetailAppBar extends StatelessWidget {
  final double shrinkOffset;
  final double expandedHeight;
  final String movieTitle;

  const DetailAppBar({
    Key? key,
    required this.shrinkOffset,
    required this.expandedHeight,
    required this.movieTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: locator<AppearanceHelper>().appear(shrinkOffset, expandedHeight),
      child: AppBar(
        title: Text(movieTitle),
        centerTitle: true,
      ),
    );
  }
}
