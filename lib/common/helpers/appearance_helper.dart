class AppearanceHelper {
  double appear(double shrinkOffset, double expandedHeight) =>
      shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset, double expandedHeight) =>
      1 - shrinkOffset / expandedHeight;
}
