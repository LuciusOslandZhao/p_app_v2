import 'package:flutter/material.dart';
import 'category_card_horiziontal.dart';

class CategoryCardSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CategoryCardSliderState();
}

class _CategoryCardSliderState extends State<CategoryCardSlider> {
  List categories = [
    {"tag": "Apartment", "url": "https://picsum.photos/id/1060/250"},
    {"tag": "Townhouse", "url": "https://picsum.photos/id/1061/250"},
    {"tag": "House", "url": "https://picsum.photos/id/1062/250"},
    {"tag": "Unit", "url": "https://picsum.photos/id/1063/250"},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 1 / 2 * 2 / 3 + 8,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var item in categories)
            CategoryCard(
              category: item['tag'],
              imgUrl: item['url'],
            ),
        ],
      ),
    );
  }
}
