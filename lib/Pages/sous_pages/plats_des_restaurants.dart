import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'plats_des_restaurants_widget.dart';

class PlatsDesRestaurants extends StatefulWidget {
  static const nomDeLaRoute = "/plats_des_restaurants";
  @override
  _PlatsDesRestaurantsState createState() => _PlatsDesRestaurantsState();
}

class _PlatsDesRestaurantsState extends State<PlatsDesRestaurants> {
  List<bool?> lesFavoris = [false, false, false];

  Future<void> sharedPref(nomDuRestaurant, definitionDesPlats) async {
    final sharPref = await SharedPreferences.getInstance();
    for (var i = 0; i < 3; i++) {
      lesFavoris[i] =
          sharPref.getBool(nomDuRestaurant + definitionDesPlats[i]["plat"])!;
      if (lesFavoris[i] == null) {
        lesFavoris[i] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as List<dynamic>;
    String imageAssets = arguments[0];
    String nomDuRestaurant = arguments[1];
    List<String> imagesDesPlats = arguments[2];
    List<Map<String, dynamic>> definitionDesPlats = arguments[3];

    return Scaffold(
      appBar: AppBar(
        title: Text("Plats"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: sharedPref(nomDuRestaurant, definitionDesPlats),
        builder: (BuildContext context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : PlatsDesRestaurantsWidget(imageAssets, nomDuRestaurant,
                  imagesDesPlats, definitionDesPlats, lesFavoris.cast<bool>());
        },
      ),
    );
  }
}
