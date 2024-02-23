import 'package:flutter/material.dart';

import '../Options/options_de_base.dart';

class PointsWidget extends StatefulWidget {
  final int pageBanniere;
  final List<Map<String, dynamic>> restaurantsBanniere;

  PointsWidget(
      {required this.pageBanniere, required this.restaurantsBanniere});

  @override
  _PointsWidgetState createState() => _PointsWidgetState();
}

class _PointsWidgetState extends State<PointsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(OptionEspaces.spaceSize5),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:
              List.generate(widget.restaurantsBanniere.length, (int index) {
            return Container(
              margin: const EdgeInsets.all(OptionEspaces.spaceSize5),
              height: OptionEspaces.spaceSize10,
              width: OptionEspaces.spaceSize10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    widget.pageBanniere == index ? Colors.white : Colors.grey,
              ),
            );
          }),
        ),
      ),
    );
  }
}
