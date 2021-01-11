import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Options/options_de_base.dart';
import 'Options/banniere_notifier_provider.dart';
import 'pages_de_navigation.dart';
import 'Pages/sous_pages/plats_des_restaurants.dart';
import 'Pages/sous_pages/commande_par_drone.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: OptionCouleurs.whiteColor,
        scaffoldBackgroundColor: OptionCouleurs.scaffoldBackgroundColor,
        canvasColor: OptionCouleurs.whiteColor,
      ),
      home: ChangeNotifierProvider(
        create: (BuildContext context) {
          return BanniereNotifierProvider();
        },
        child: SystemUI(),
      ),
      routes: {
        PlatsDesRestaurants.nomDeLaRoute: (_) => PlatsDesRestaurants(),
        CommandeParDrone.nomDeLaRoute: (_) => CommandeParDrone(),
      },
    );
  }
}

class SystemUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return AnnotatedRegion<SystemUiOverlayStyle>(
        child: PagesDeNavigation(),
        value: SystemUiOverlayStyle(
            systemNavigationBarColor: OptionCouleurs.whiteColor,
            systemNavigationBarIconBrightness: Brightness.dark));
  }
}
