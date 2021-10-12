import 'package:flutter/material.dart';
import 'package:moviepedia/common/configs/ui_configs.dart';

class MovieOverview extends StatelessWidget {
  final String overview;

  const MovieOverview({Key? key, required this.overview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              overview,
              style:
                  TextStyle(color: UiConfigs.overviewTextColor, fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
