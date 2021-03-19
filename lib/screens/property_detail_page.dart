import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:p_app_v2/models/property_model.dart';

class PropertyDetailPage extends StatefulWidget {
  final PropertyModel property;

  const PropertyDetailPage({Key key, this.property}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _PropertyDetailPageState(property: property);
}

class _PropertyDetailPageState extends State<PropertyDetailPage> {
  final PropertyModel property;

  _PropertyDetailPageState({this.property});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.white),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: ListView(scrollDirection: Axis.vertical, children: [
            SizedBox(
              height: 300,
              child: ListView(
                semanticChildCount: property.imageUrls.length,
                scrollDirection: Axis.horizontal,
                children: [
                  for (var imageurl in property.imageUrls)
                    Image(
                      width: MediaQuery.of(context).size.width,
                      image: NetworkImage("$imageurl"),
                    ),
                ],
              ),
            ),
            Html(data: property.description),
          ]),
        ),
      ),
    );
  }
}
