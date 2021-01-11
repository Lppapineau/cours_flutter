import 'package:cours_flutter/Options/options_de_base.dart';
import 'package:cours_flutter/Options/restaurants_types.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Options/restaurants_bannieres.dart';
import '../Widgets/liste_des_restaurants.dart';
import '../Options/nom_des_restaurants.dart';
import '../Options/images_des_restaurants.dart';
import '../Options/banniere_notifier_provider.dart';
import '../Widgets/Points_widget.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int bannierePage;
  List<Map<String, dynamic>> restaurantsBannieres =
      RestaurantsBannieres.restaurantsBannieres;
  List<String> restaurantsTypes = RestaurantsTypes.restaurantsTypes;
  List<List<String>> nomDesRestaurants = NomDesRestaurants.nomDesRestaurants;
  List<List<String>> imagesDesRestaurants =
      ImagesDesRestaurants.imagesDesRestaurants;
  @override
  Widget build(BuildContext context) {
    bannierePage = 0;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints boxConstrains) {
        double lesBanniereHauteur = boxConstrains.maxHeight / 3;
        double restaurantsLargeur = boxConstrains.maxWidth / 2;
        double restaurantsHauteur = boxConstrains.maxHeight / 4;
        return Scaffold(
          appBar: AppBar(
            title: Text("Menu"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: lesBanniereHauteur,
                  child: Stack(
                    children: [
                      PageView.builder(
                        onPageChanged: (int valeur) {
                          bannierePage = valeur;
                          Provider.of<BanniereNotifierProvider>(context,
                                  listen: false)
                              .actualPage(bannierePage);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                child: ShaderMask(
                                  shaderCallback: (mask) {
                                    return LinearGradient(
                                            colors: [
                                          Color.fromRGBO(
                                              OptionShader.shader50,
                                              OptionShader.shader50,
                                              OptionShader.shader50,
                                              1),
                                          OptionCouleurs.whiteColor
                                        ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter)
                                        .createShader(mask);
                                  },
                                  child: Image.asset(
                                    "assets/plat3.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(
                                    OptionEspaces.spaceSize10),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    restaurantsBannieres[index]["restaurant"],
                                    style: TextStyle(
                                        fontSize:
                                            OptionGrandeurTexte.textSize20,
                                        color: OptionCouleurs.whiteColor),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        itemCount: restaurantsBannieres.length,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                                              child: Consumer<BanniereNotifierProvider>(
                          builder: (context, points, child) {
                            return PointsWidget(
                              pageBanniere: bannierePage,
                              restaurantsBanniere: restaurantsBannieres,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Column(
                  children: List.generate(
                    restaurantsTypes.length,
                    (index) {
                      return ListeDesRestaurants(
                        restaurantType: restaurantsTypes[index],
                        banniereHauteur: restaurantsHauteur,
                        restaurantsLargeur: restaurantsLargeur,
                        nomDesRestaurants: nomDesRestaurants[index],
                        imagesDesRestaurants: imagesDesRestaurants[index],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
