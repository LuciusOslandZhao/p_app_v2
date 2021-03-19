import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:p_app_v2/models/property_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
void initState(){
  super.initState();
  if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
}
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.blue),
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
            Container(
                child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Icon(
                  Icons.image,
                  size: 50,
                ),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(children: [
                      Icon(
                        Icons.star,
                        size: 50,
                      ),
                      Icon(
                        Icons.share,
                        size: 50,
                      ),
                    ])),
              ]),
              ButtonBar(
                  alignment: MainAxisAlignment.start,
                  buttonMinWidth: 100,
                  children: [
                    FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: const Text('FOR SALE'),
                      onPressed: () {},
                    ),
                  ]),
            ])),
            Container(
                color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        "Airport with jdsdb efecjdc ndanj",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.follow_the_signs),
                        Text("71 xxx St, Holt,ACT"),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text("By negotiation",
                          style: TextStyle(fontSize: 24)),
                    )
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                  color: Colors.yellow,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text("OVERVIEW", style: TextStyle(fontSize: 24)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Column(
                                children: [
                                  Text("Townhouse"),
                                  Text("Prooperty Type")
                                ],
                              ),
                              Container(
                                height: 30,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.bathtub),
                                      Text("1.5")
                                    ],
                                  ),
                                  Text("Bathroom")
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [Icon(Icons.king_bed), Text("3")],
                                  ),
                                  Text("Bedroom")
                                ],
                              ),
                              Container(
                                height: 30,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.car_rental),
                                      Text("2")
                                    ],
                                  ),
                                  Text("Garages")
                                ],
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )),
            ),
            Container(
                child: Column(
              children: [
                Text("Description"),
                Html(data: property.description),
              ],
            )),
            Container(
                color: Colors.grey,
                child: Column(
                  children: [
                    Text("Description"),
                    Html(
                        data: getMap(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            address: property.address)),
                  ],
                )),
            Container(
              height: 300,
              width: 400,
              child: WebView(
                initialUrl: "https://www.youtube.com/embed/f02mOEt11OQ/",

              )
            ),
            Container(
                height: 300,
                width: 300,
                child: WebView(
                  initialUrl: Uri.dataFromString(
                          '<html><body><iframe width="400" height="315" src="https://www.youtube.com/embed/f02mOEt11OQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></body></html>',
                          mimeType: 'text/html')
                      .toString(),
                  javascriptMode: JavascriptMode.unrestricted,
                )),
          ]),
        ),
      ),
    );
  }
}

String getMap({String address, double height, double width}) {
  print(address);
  var map =
      '<html><div class="mapouter"><div class="gmap_canvas"><iframe width="$width" height="$height" id="gmap_canvas" src="https://maps.google.com/maps?q=$address&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://123movies-to.org">123movies</a><br><style>.mapouter{position:relative;text-align:right;height:${height}px;width:${width}px;}</style><a href="https://www.embedgooglemap.net">create a map with google maps</a><style>.gmap_canvas {overflow:hidden;background:none!important;height:${height}px ;width:${width}px;}</style></div></div></html>';
  return map;
}
