import 'package:flutter/material.dart';
import 'package:p_app_v2/common/constants.dart';
import 'package:p_app_v2/models/app_state_model.dart';
import 'package:p_app_v2/widgets/property_card_vertical.dart';
import 'package:provider/provider.dart';

class BrowseListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BrowseListPageState();
}

class _BrowseListPageState extends State<BrowseListPage> {
  int currentPage = 2;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (ctx, model, idx) {
      return model.load
          ? Center(
              child: myProgressIndicator,
            )
          : NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
                  setState(() {
                    currentPage++;
                  });
                  model.loadMore(currentPage);
                }
              },
              // child: ListView.builder(
              //   scrollDirection: Axis.vertical,
              //   itemCount: model.houses.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     return PropertyCardVertical(property: model.houses[index]);
              //     },
                
              // ),
              child: ListView(
                children: [
                  for(var property in model.houses)
                  PropertyCardVertical(property:property),

                  model.loadingMore ?Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
              child: myProgressIndicator,
            ),
                  ) :Spacer()
                ],
              ),
            );
    });
  }
}
