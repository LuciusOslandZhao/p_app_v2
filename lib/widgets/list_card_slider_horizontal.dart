import 'package:flutter/material.dart';
import 'package:p_app_v2/models/app_state_model.dart';
import 'package:p_app_v2/models/property_model.dart';
import 'package:p_app_v2/widgets/list_card_horiziontal.dart';
import 'package:provider/provider.dart';

class ListCardSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListCardSliderState();
}

class _ListCardSliderState extends State<ListCardSlider> {
  PropertyModel property;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (ctx, model, child) {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 1.5 / 3 + 8,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (var property in model.homepageList)
              ListCard(
                property: property,
              ),
          ],
        ),
      );
    });
  }

  
}
