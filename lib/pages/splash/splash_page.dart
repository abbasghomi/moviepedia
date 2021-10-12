import 'package:flutter/material.dart';
import 'package:moviepedia/common/configs/ui_configs.dart';
import 'package:moviepedia/pages/popular_movies/popular_movies_page.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final ValueNotifier<bool> _appear = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      _appear.value = true;
    }).then((value) {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => PopularMoviesPage()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiConfigs.pageBackColor,
      body: ValueListenableBuilder(
          valueListenable: _appear,
          builder: (_, __, ___) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedOpacity(
                    opacity: _appear.value ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 1000),
                    child: Center(
                      child: Text('Flutter UI Challenge',
                          style: UiConfigs.defaultTextStyle),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: _appear.value ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 5000),
                    child: Center(
                      child: Text('By Abbas Ghomi',
                          style: UiConfigs.defaultTextStyle2),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _appear.dispose();
  }
}
