import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Options/options_de_base.dart';
import '../Options/nom_des_restaurants.dart';
import '../Options/definitions_des_plats.dart';
import '../Options/images_des_plats.dart';

class FavorisPage extends StatefulWidget {
  @override
  _FavorisPageState createState() => _FavorisPageState();
}

List<Widget> widgets = [];
int nDuRestaurant = 0;

int nDuPlat = 0;


Future<void> sharedPref(
    nomDesRestaurants, definitionDesPlats, platsHauteur, imagesDesPlats) async {
  final sharPref = await SharedPreferences.getInstance();
  nomDesRestaurants.forEach((element) {
    nDuRestaurant = 0;
    element.forEach((restaurant) {
      definitionDesPlats.forEach((lesPlats) {
        nDuPlat = 0;
        lesPlats.forEach((plat) {
          if (sharPref.getBool(restaurant + plat["plat"]) == true) {
            print(restaurant + plat["plat"]);
            widgets.add(banniere(
                platsHauteur,
                imagesDesPlats[nDuRestaurant][nDuPlat],
                definitionDesPlats[nDuRestaurant][nDuPlat]));
          }
          nDuPlat = nDuPlat + 1;
        });
      });
      nDuRestaurant = nDuRestaurant + 1;
    });
  });
}

Widget banniere(platsHauteur, imageDuPlat, definitionDuPlat) {
  return Container(
    height: platsHauteur,
    child: Stack(
      children: [
        Container(
          width: double.infinity,
          height: platsHauteur,
          child: ShaderMask(
            shaderCallback: (mask) {
              return LinearGradient(colors: [
                Color.fromRGBO(OptionShader.shader50, OptionShader.shader50,
                    OptionShader.shader50, 1),
                OptionCouleurs.whiteColor
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
                  .createShader(mask);
            },
            child: Image.asset(
              imageDuPlat,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            width: double.infinity,
            color: OptionCouleurs.whiteColor,
            padding: const EdgeInsets.all(OptionEspaces.spaceSize20),
            child: Text(definitionDuPlat["plat"]),
          ),
        ),
      ],
    ),
  );
}

class _FavorisPageState extends State<FavorisPage> {
  List<List<String>> nomDesRestaurants = NomDesRestaurants.nomDesRestaurants;
  List<List<String>> imagesDesPlats = ImagesDesPlats.imagesDesPlats;
  List<List<Map<String, dynamic>>> definitionDesPlats =
      DefinitionsDesPlats.definitionDesPlats;
  double platsHauteur = 250;
  @override
  Widget build(BuildContext context) {
    widgets = [];
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoris"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: sharedPref(nomDesRestaurants, definitionDesPlats, platsHauteur,
            imagesDesPlats),
        builder: (BuildContext context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: widgets,
                  ),
                );
        },
      ),
    );
  }
}
