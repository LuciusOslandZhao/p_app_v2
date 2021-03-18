import 'package:flutter/material.dart';
import 'package:p_app_v2/models/app_state_model.dart';
import 'package:p_app_v2/widgets/property_card_vertical.dart';
import 'package:provider/provider.dart';

class BrowseListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BrowseListPageState();
}

class _BrowseListPageState extends State<BrowseListPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (ctx, model, idx) {
      return model.load
          ? Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            )
          : ListView(
              scrollDirection: Axis.vertical,
              children: [
                for (var item in model.houses) PropertyCardVertical(property:item),
              ],
            );
    });
  }
}
