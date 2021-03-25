import 'package:flutter/material.dart';
import 'package:p_app_v2/common/constants.dart';
import 'package:p_app_v2/models/app_state_model.dart';
import 'package:p_app_v2/models/property_model.dart';
import 'package:p_app_v2/widgets/property_card_vertical.dart';
import 'package:provider/provider.dart';

class FavouriteListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavouriteListPageState();
}

class _FavouriteListPageState extends State<FavouriteListPage> {

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (ctx, model, idx) {
      return model.load
          ? Center(
              child: myProgressIndicator,
            )
          : model.favourites.length<1 ? Center(child: Text('No Content'),):
          // ListView(
          //     scrollDirection: Axis.vertical,
          //     children: model.favourites.isEmpty? [
          //      Center(child: 
          //       Text("No Favourites")
          //       ,),
          //     ]:[
          //       for (var item in model.favourites) PropertyCardVertical(property:item),
          //     ],
          //   )
          AnimatedList(
  key: listKey,
  initialItemCount: model.favourites.length,
  itemBuilder: (context, index, animation) {
    return buildItem(context, index, animation, model.favourites[index]); // Refer step 3
  },
)
            ;
    });
  }



  Widget buildItem(
      BuildContext context, int index, Animation<double> animation, PropertyModel property) {
    return SizeTransition(
      key: ValueKey<int>(index),
      axis: Axis.vertical,
      sizeFactor: animation,
      child: PropertyCardVertical(property: property,),
    );
}
}

// ListView(
//               scrollDirection: Axis.vertical,
//               children: model.favourites.isEmpty? [
//                Center(child: 
//                 Text("No Favourites")
//                 ,),
//               ]:[
//                 for (var item in model.favourites) PropertyCardVertical(property:item),
//               ],
//             )