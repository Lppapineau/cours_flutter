import 'package:flutter/material.dart';

import 'Pages/menu.dart';
import 'Widgets/custom_navigation_bar.dart';
import 'Pages/favoris.dart';
import 'Pages/sandbox.dart';

class PagesDeNavigation extends StatefulWidget {
  @override
  _PagesDeNavigationState createState() => _PagesDeNavigationState();
}

class _PagesDeNavigationState extends State<PagesDeNavigation> {
  List<String> nomDesPages = ["Menu", "Favoris", "Sandbox"];
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage == 0
          ? MenuPage()
          : currentPage == 1 ? FavorisPage() : SandboxPage(),
      bottomNavigationBar: CustomNavigationBar(
        function: (valeur) {
          setState(() {
            currentPage = valeur;
          });
        },
        nomDesPages: nomDesPages,
      ),
    );
  }
}
