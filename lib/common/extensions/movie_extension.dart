import 'package:moviepedia/common/constants/urls.dart';

extension MoviPath on String {
  String toNormalImageAbsolutePath() => Urls.imagePrefixPathNormal + this;

  String toDuoToneImageAbsolutePath() => Urls.imagePrefixPathDuotone + this;
}
