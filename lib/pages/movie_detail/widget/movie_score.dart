import 'package:flutter/material.dart';
import 'package:moviepedia/common/app/app_dependency_injection.dart';
import 'package:moviepedia/common/configs/ui_configs.dart';
import 'package:moviepedia/common/helpers/appearance_helper.dart';

class MovieScore extends StatelessWidget {
  final double shrinkOffset;
  final double voteAverage;
  final double expandedHeight;

  const MovieScore({
    Key? key,
    required this.shrinkOffset,
    required this.voteAverage,
    required this.expandedHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var voteAveragePercentage = 100 * voteAverage / 10;
    return Opacity(
      opacity:
          locator<AppearanceHelper>().disappear(shrinkOffset, expandedHeight),
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: UiConfigs.pageBackColor,
        ),
        child: Stack(
          children: [
            CircularProgressIndicator(
              value: voteAveragePercentage / 100,
              color: UiConfigs.progressBarColor,
            ),
            Positioned.fill(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '${(voteAveragePercentage).toStringAsFixed(1)}%',
                    style: TextStyle(fontSize: 9.0, color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
