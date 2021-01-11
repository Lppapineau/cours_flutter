import 'package:flutter/material.dart';

import '../Options/options_de_base.dart';
import '../Pages/sous_pages/plats_des_restaurants.dart';
import '../Options/images_des_plats.dart';
import '../Options/definitions_des_plats.dart';

class ListeDesRestaurants extends StatefulWidget {
  final String restaurantType;
  final double banniereHauteur;
  final double restaurantsLargeur;
  final List<String> nomDesRestaurants;
  final List<String> imagesDesRestaurants;

  ListeDesRestaurants({
    @required this.restaurantType,
    @required this.banniereHauteur,
    @required this.restaurantsLargeur,
    @required this.nomDesRestaurants,
    @required this.imagesDesRestaurants,
  });

  @override
  _ListeDesRestaurantsState createState() => _ListeDesRestaurantsState();
}

class _ListeDesRestaurantsState extends State<ListeDesRestaurants> {
  List<List<String>> imagesDesPlats = ImagesDesPlats.imagesDesPlats;
  List<List<Map<String, dynamic>>> definitionDesPlats =
      DefinitionsDesPlats.definitionDesPlats;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(OptionEspaces.spaceSize10),
          width: double.infinity,
          child: Text(
            widget.restaurantType,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: OptionGrandeurTexte.textSize20,
            ),
          ),
        ),
        Container(
          height: widget.banniereHauteur,
          child: CustomScrollView(
            scrollDirection: Axis.horizontal,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  List.generate(
                    3,
                    (index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: index == 0 ? 0 : OptionEspaces.spaceSize10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                PlatsDesRestaurants.nomDeLaRoute,
                                arguments: [
                                  widget.imagesDesRestaurants[index],
                                  widget.nomDesRestaurants[index],
                                  imagesDesPlats[index],
                                  definitionDesPlats[index],
                                ]);
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: widget.restaurantsLargeur,
                                height: widget.banniereHauteur,
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
                                    widget.imagesDesRestaurants[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: widget.restaurantsLargeur,
                                  color: OptionCouleurs.whiteColor,
                                  padding: const EdgeInsets.all(
                                      OptionEspaces.spaceSize10),
                                  child: Text(widget.nomDesRestaurants[index]),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: OptionEspaces.spaceSize10,
        )
      ],
    );
  }
}
