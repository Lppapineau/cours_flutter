import 'package:flutter/material.dart';

import '../Widgets/Points_widget.dart';

class BanniereNotifierProvider extends ChangeNotifier {
  int? pageBanniere;

  BanniereNotifierProvider({this.pageBanniere});

  actualPage(bannerPageInput) {
    pageBanniere = bannerPageInput;
    notifyListeners();
  }

  Widget getDotsWidget(
      {required bannerRestaurants, required pageNouvelleBanniere}) {
    if (pageBanniere == null) {
      pageBanniere = 0;
    } else {
      pageBanniere = pageNouvelleBanniere;
    }
    return PointsWidget(
        pageBanniere: pageBanniere!, restaurantsBanniere: bannerRestaurants);
  }
}
