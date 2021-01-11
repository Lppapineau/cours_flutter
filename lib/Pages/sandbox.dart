import 'package:flutter/material.dart';
import '../Options/options_de_base.dart';
import '../Options/restaurants_bannieres.dart';

class SandboxPage extends StatefulWidget {
  @override
  _SandboxPageState createState() => _SandboxPageState();
}

class _SandboxPageState extends State<SandboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sandbox"),
      ),
      body: Column(
        children: [
          Text(
            RestaurantsBannieres.restaurantsBannieres[0]["restaurant"],
          ),
          Text(
            RestaurantsBannieres.restaurantsBannieres[1]["restaurant"],
          ),
          Text(
            RestaurantsBannieres.restaurantsBannieres[2]["restaurant"],
          )
        ],
      ),
    );
  }
}
