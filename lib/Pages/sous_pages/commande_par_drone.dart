import 'package:flutter/material.dart';

import '../../Options/options_de_base.dart';
import '../menu.dart';

class CommandeParDrone extends StatefulWidget {
  static const nomDeLaRoute = "/commande_par_drone";
  @override
  _CommandeParDroneState createState() => _CommandeParDroneState();
}

class _CommandeParDroneState extends State<CommandeParDrone> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> arguments = ModalRoute.of(context).settings.arguments;
    double platsHauteur = arguments[0];
    String imageDuPlat = arguments[1];
    Map<String, dynamic> definitionDuPlat = arguments[2];
    return Scaffold(
      appBar: AppBar(
        title: Text("Commande Par Drone"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
            ),
            SizedBox(
              height: OptionEspaces.spaceSize10,
            ),
            Container(
              color: OptionCouleurs.whiteColor,
              child: ListTile(
                title: Text("Votre commande"),
              ),
            ),
            Container(
              color: OptionCouleurs.whiteColor,
              child: ListTile(
                trailing: Text(definitionDuPlat["Price"].toString() + " \$"),
                title: Text(definitionDuPlat["plat"]),
                subtitle: Text(definitionDuPlat["Description"]),
              ),
            ),
            SizedBox(
              height: OptionEspaces.spaceSize10,
              child: Container(
                color: OptionCouleurs.whiteColor,
              ),
            ),
            SizedBox(
              height: OptionEspaces.spaceSize10,
            ),
            Container(
              color: OptionCouleurs.whiteColor,
              child: ListTile(
                title: Text("Sommaire"),
              ),
            ),
            Container(
              color: OptionCouleurs.whiteColor,
              child: ListTile(
                trailing: Text(definitionDuPlat["Price"].toString() + " \$"),
                title: Text("Total"),
              ),
            ),
            Container(
              color: OptionCouleurs.whiteColor,
              child: ListTile(
                trailing: Text(
                    (definitionDuPlat["Price"] * 0.15).toStringAsFixed(2) +
                        " \$"),
                title: Text("Taxe"),
              ),
            ),
            Container(
              color: OptionCouleurs.whiteColor,
              child: ListTile(
                trailing: Text("3.99" + " \$"),
                title: Text("Coût de livraison"),
              ),
            ),
            Container(
              color: OptionCouleurs.whiteColor,
              child: ListTile(
                trailing: Text((3.99 * 0.15).toStringAsFixed(2) + " \$"),
                title: Text("Coût de livraison (Taxe)"),
              ),
            ),
            Divider(
              thickness: 1,
              height: 0,
            ),
            Container(
              color: OptionCouleurs.whiteColor,
              child: ListTile(
                trailing: Text(
                  (definitionDuPlat["Price"] * 1.15 + 3.99 * 1.15)
                          .toStringAsFixed(2) +
                      " \$",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                title: Text(
                  "Total",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: OptionEspaces.spaceSize10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: MaterialButton(
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        color: OptionCouleurs.primaryColor,
        child: Text(
          'Commande par Drone',
          style: TextStyle(
              color: Colors.white, fontSize: OptionGrandeurTexte.textSize20),
        ),
      ),
    );
  }
}
