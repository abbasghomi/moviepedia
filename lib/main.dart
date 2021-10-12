import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviepedia/app.dart';
import 'package:moviepedia/common/app/app_dependency_injection.dart';



Future<void> main() async {
  await setupGetItLocators();
  // var t = await ApiConfigs.client.getPopularMovies(1);//.then((it) => logger.i(it.toJson()));
  runApp(App());
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
      overlays: []);
}
