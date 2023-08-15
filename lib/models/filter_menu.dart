import "package:flutter/material.dart";

import "filter.dart";

class FilterMenu extends ChangeNotifier {
  final List<Filter> _filterFood = [
    Filter(
      name: 'Sushi',
      imagePath: 'lib/images/original_sushi.png',
    ),
    Filter(
      name: 'Toro',
      imagePath: 'lib/images/toro.png',
    ),
    Filter(
      name: 'Ramen',
      imagePath: 'lib/images/ramen.png',
    ),
    Filter(
      name: 'Drinks',
      imagePath: 'lib/images/drinks.png',
    ),
  ];

  List<Filter> get filterFood => _filterFood;
}