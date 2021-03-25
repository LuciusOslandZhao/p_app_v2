import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:p_app_v2/common/constants.dart';
import 'package:p_app_v2/models/property_model.dart';
import 'package:p_app_v2/services/price_num_helper.dart';
import 'package:p_app_v2/widgets/google_maps.dart';
import 'package:p_app_v2/widgets/google_maps_widget.dart';
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

  String maps;

  @override
  void initState() {
    maps =
        '<html lang="en"><body><iframe width="100%" height="100%" style="border:0" loading="lazy" allowfullscreen src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCXHxN1Jd-3wYZUrPq0zIRe-t52puaGR2U &q=${property.address}"></iframe></body></html>';
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
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
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  child: ListView(
                    semanticChildCount: property.imageUrls.length,
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (var imageurl in property.imageUrls)
                        Image(
                          loadingBuilder: (ctx, w, event) {
                            if (event == null) {
                              return w;
                            }
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width * 2 / 3,
                              child: Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      MyPrimaryColor),
                                  value: event.expectedTotalBytes != null
                                      ? event.cumulativeBytesLoaded /
                                          event.expectedTotalBytes
                                      : null,
                                ),
                              ),
                            );
                          },
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width * 2 / 3,
                          fit: BoxFit.cover,
                          image: NetworkImage("$imageurl"),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      " ${property.imageUrls.length} Pics ",
                      style: TextStyle(
                          color: Colors.white, backgroundColor: Colors.grey),
                    ),
                  ),
                )
              ],
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        padding: const EdgeInsets.only(
                            left: 5.0, right: 5, top: 3, bottom: 3),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(color: Colors.blue)),
                        child: Text(
                          "FOR SALE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            ),
            Divider(),
            Container(
                // color: Colors.red,
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "${property.title}",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.place),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text("${property.address}"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text("${formatPriceNum(property.price)}", style: TextStyle(fontSize: 24)),
                )
              ],
            )),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                  // color: Colors.yellow,
                  child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Overview", style: TextStyle(fontSize: 24))),

                  Table(
                      // border: TableBorder.all(),
                      columnWidths: const <int, TableColumnWidth>{
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                        2: FixedColumnWidth(64),
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: <TableRow>[
                        TableRow(children: <Widget>[
                          Container(child: Text("Townhouse")),
                          Container(height: 32),
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.bathtub),
                                Text("${property.bathrooms}")
                              ],
                            ),
                          ),
                          Container(height: 32),
                          Container(height: 32),
                        ]),
                        TableRow(children: <Widget>[
                          Container(child: Text("Prooperty Type")),
                          Container(height: 32),
                          Container(child: Text("Bathroom")),
                          Container(height: 32),
                          Container(height: 32),
                        ]),
                        TableRow(children: <Widget>[
                          Container(height: 32),
                          Container(height: 32),
                          Container(height: 32),
                          Container(height: 32),
                          Container(height: 32),
                        ]),
                        TableRow(children: <Widget>[
                          Container(
                            child: Row(
                              children: [
                                bedroomIcon,
                              
                                Padding(
                                  padding: const EdgeInsets.only(left:3.0),
                                  child: Text("${property.bedrooms}"),
                                )
                              ],
                            ),
                          ),
                          Container(height: 32),
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.drive_eta),
                                Text("${property.garages}") // garages
                              ],
                            ),
                          ),
                          Container(height: 32),
                          Container(height: 32),
                        ]),
                        TableRow(children: <Widget>[
                          Container(child: Text("Bedroom")),
                          Container(height: 32),
                          Container(child: Text("Garages")),
                          Container(height: 32),
                          Container(height: 32),
                        ]),
                      ]),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Column(
                  //       children: [
                  //         Column(
                  //           children: [
                  //             Text("Townhouse"),
                  //             Text("Prooperty Type")
                  //           ],
                  //         ),
                  //         Container(
                  //           height: 30,
                  //         ),
                  //         Column(
                  //           children: [
                  //             Row(
                  // children: [
                  //   Icon(Icons.bathtub),
                  //   Text("1.5")
                  // ],
                  //             ),
                  //             Text("Bathroom")
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //     Column(
                  //       children: [
                  //         Column(
                  //           children: [
                  //             Row(
                  //               children: [Icon(Icons.king_bed), Text("3")],
                  //             ),
                  //             Text("Bedroom")
                  //           ],
                  //         ),
                  //         Container(
                  //           height: 30,
                  //         ),
                  //         Column(
                  //           children: [
                  //             Row(
                  //               children: [
                  //                 Icon(Icons.car_rental),
                  //                 Text("2")
                  //               ],
                  //             ),
                  //             Text("Garages")
                  //           ],
                  //         ),
                  //       ],
                  //     )
                  //   ],
                  // )
                ],
              )),
            ),
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Description"),
                Html(data: property.description),
              ],
            )),
            // Container(
            //     color: Colors.grey,
            //     child: Column(
            //       children: [
            //         Text("Description"),
            //         Html(
            //             data: getMap(
            //                 height: MediaQuery.of(context).size.height,
            //                 width: MediaQuery.of(context).size.width,
            //                 address: property.address)),
            //       ],
            //     )),
            // Container(
            //     height: 300,
            //     width: 400,
            //     child: WebView(
            //         // initialUrl: "https://www.youtube.com/embed/f02mOEt11OQ/",
            //         )),
            Divider(),

 Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: MapSample()
                ),

                Divider(),

            Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: GoogleMapsWidget(address: property.address)),



            // Container(
            //   decoration: BoxDecoration(border: Border.all()),
            //   child: MapSample())
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
