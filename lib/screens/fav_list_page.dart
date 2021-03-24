import 'package:flutter/material.dart';
import 'package:p_app_v2/models/app_state_model.dart';
import 'package:p_app_v2/widgets/property_card_vertical.dart';
import 'package:provider/provider.dart';

class FavouriteListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavouriteListPageState();
}

class _FavouriteListPageState extends State<FavouriteListPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (ctx, model, idx) {
      return model.load
          ? Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            )
          : model.favourites.length<1 ? Center(child: Text('No Content'),):
          ListView(
              scrollDirection: Axis.vertical,
              children: model.favourites.isEmpty? [
               Center(child: 
                Text("No Favourites")
                ,),
              ]:[
                for (var item in model.favourites) PropertyCardVertical(property:item),
              ],
            );
    });
  }
}
