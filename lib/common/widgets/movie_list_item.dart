import 'package:flutter/material.dart';
import 'package:moviepedia/common/extensions/movie_extension.dart';
import 'package:moviepedia/common/models/movie/result.dart';
import 'package:moviepedia/pages/movie_detail/movie_detail_page.dart';

class MovieListItem extends StatelessWidget {
  final Result movieItem;

  MovieListItem({required this.movieItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 65,
                  backgroundImage: AssetImage('assets/images/loading.gif'),
                  child: movieItem.posterPath == null
                      ? SizedBox.shrink()
                      : CircleAvatar(
                          radius: 65,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(movieItem.posterPath!
                              .toNormalImageAbsolutePath()),
                        ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 70 / 100,
                child: Text(
                  '${movieItem.title}',
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black26,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MovieDetailPage(movieItem: movieItem)));
            },
          )
        ],
      ),
    );
  }
}
