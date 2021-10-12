import 'package:flutter/material.dart';
import 'package:moviepedia/common/app/app_dependency_injection.dart';
import 'package:moviepedia/common/extensions/movie_extension.dart';
import 'package:moviepedia/common/helpers/appearance_helper.dart';

class MoviePoster extends StatelessWidget {
  final double shrinkOffset;
  final String? imageUrl;
  final String movieTitle;
  final double expandedHeight;

  MoviePoster(
      {Key? key,
      required this.shrinkOffset,
      required this.movieTitle,
      required this.expandedHeight,
      this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity:
          locator<AppearanceHelper>().disappear(shrinkOffset, expandedHeight),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: imageUrl == null
              ? Stack(
                  children: [
                    Image(
                      fit: BoxFit.fitHeight,
                      image: AssetImage('assets/images/loading.gif'),
                    ),
                    Positioned(
                        bottom: 50.0,
                        left: 20.0,
                        child: Text(
                          movieTitle,
                          style:
                              TextStyle(color: Colors.black87, fontSize: 24.0),
                        )),
                  ],
                )
              : Image.network(
                  imageUrl!.toNormalImageAbsolutePath(),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
