import 'package:flutter/material.dart';

import '../Options/options_de_base.dart';

class CustomNavigationBar extends StatefulWidget {
  final List<String> nomDesPages;
  final Function(int valeur) function;
  CustomNavigationBar({required this.nomDesPages, required this.function});
  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentItem = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (currItem) {
        setState(() {
          currentItem = currItem;
          widget.function(currentItem);
        });
      },
      currentIndex: currentItem,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.view_list),
          label: widget.nomDesPages[0],
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: widget.nomDesPages[1],
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.functions),
        //   title: Text(widget.nomDesPages[2]),
        // ),
      ],
      selectedItemColor: OptionCouleurs.primaryColor,
    );
  }
}
