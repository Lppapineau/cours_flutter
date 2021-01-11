import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Options/options_de_base.dart';
import 'commande_par_drone.dart';

class PlatsDesRestaurantsWidget extends StatefulWidget {
  final String imageAssets;
  final String nomDuRestaurant;
  final List<String> imagesDesPlats;
  final List<Map<String, dynamic>> definitionDesPlats;
  final List<bool> lesFavoris;

  PlatsDesRestaurantsWidget(this.imageAssets, this.nomDuRestaurant,
      this.imagesDesPlats, this.definitionDesPlats, this.lesFavoris);

  @override
  _PlatsDesRestaurantsWidgetState createState() =>
      _PlatsDesRestaurantsWidgetState();
}

enregistrerLesFavoris(index, nomDuRestaurant, nomDuPlat, lesFavoris) async {
  final pref = await SharedPreferences.getInstance();
  await pref.setBool(nomDuRestaurant + nomDuPlat, lesFavoris[index]);
}

class _PlatsDesRestaurantsWidgetState extends State<PlatsDesRestaurantsWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        double restaurantHauteur = boxConstraints.maxHeight / 3;
        double platsHauteur = boxConstraints.maxHeight / 4;
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: restaurantHauteur,
                child: Stack(
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
                          widget.imageAssets,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(OptionEspaces.spaceSize10),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          widget.nomDuRestaurant,
                          style: TextStyle(
                              fontSize: OptionGrandeurTexte.textSize20,
                              color: OptionCouleurs.whiteColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: OptionEspaces.spaceSize10,
              ),
              Column(
                children: List.generate(
                  3,
                  (index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(bottom: OptionEspaces.spaceSize10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            CommandeParDrone.nomDeLaRoute,
                            arguments: [
                              platsHauteur,
                              widget.imagesDesPlats[index],
                              widget.definitionDesPlats[index]
                            ],
                          );
                        },
                        child: Container(
                          height: platsHauteur,
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: platsHauteur,
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
                                    widget.imagesDesPlats[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      OptionEspaces.spaceSize10),
                                  child: MaterialButton(
                                    padding: EdgeInsets.all(
                                        OptionEspaces.spaceSize10),
                                    minWidth: 0,
                                    color: widget.lesFavoris[index]
                                        ? OptionCouleurs.primaryColor
                                        : OptionCouleurs.whiteColor
                                            .withOpacity(0.5),
                                    onPressed: () {
                                      setState(() {
                                        widget.lesFavoris[index] =
                                            !widget.lesFavoris[index];
                                      });
                                      enregistrerLesFavoris(
                                          index,
                                          widget.nomDuRestaurant,
                                          widget.definitionDesPlats[index]
                                              ["plat"],
                                          widget.lesFavoris);
                                    },
                                    child: Icon(Icons.favorite,
                                        color: OptionCouleurs.whiteColor),
                                    shape: CircleBorder(),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: double.infinity,
                                  color: OptionCouleurs.whiteColor,
                                  padding: const EdgeInsets.all(
                                      OptionEspaces.spaceSize10),
                                  child: Text(
                                      widget.definitionDesPlats[index]["plat"]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
