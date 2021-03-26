import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:p_app_v2/common/constants.dart';
import 'package:p_app_v2/models/app_state_model.dart';
import 'package:p_app_v2/models/property_model.dart';
import 'package:p_app_v2/services/price_num_helper.dart';
import 'package:p_app_v2/widgets/google_maps_widget.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

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
  final _textParagraphStyle = TextStyle(fontSize: 16);
  final _textDescStyle = TextStyle(fontSize: 18);
  @override
  void initState() {
    print(property);
    maps =
        '<html lang="en"><body><iframe width="100%" height="100%" style="border:0" loading="lazy" allowfullscreen src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCXHxN1Jd-3wYZUrPq0zIRe-t52puaGR2U &q=${property.address}"></iframe></body></html>';
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (ctx, model, child) {
        return Theme(
          data: model.themeData,
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
                                  height:
                                      MediaQuery.of(context).size.width * 2 / 3,
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
                              color: Colors.white,
                              backgroundColor: Colors.grey),
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
                      child: Text("${formatPriceNum(property.price)}",
                          style: TextStyle(fontSize: 24)),
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
                          child:
                              Text("Overview", style: TextStyle(fontSize: 24))),
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
                                    model.bathroomIcon,
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        "${property.bathrooms}",
                                        style: _textParagraphStyle,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(height: 32),
                              Container(height: 32),
                            ]),
                            TableRow(children: <Widget>[
                              Container(child: Text("Prooperty Type")),
                              Container(height: 32),
                              Container(
                                  child: Text(
                                "Bathroom",
                                style: _textParagraphStyle,
                              )),
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
                                    model.bedroomIcon,
                                    Padding(
                                      padding: const EdgeInsets.only(left: 3.0),
                                      child: Text(
                                        "${property.bedrooms}",
                                        style: _textParagraphStyle,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(height: 32),
                              Container(
                                child: Row(
                                  children: [
                                    model.garageIcon,
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        "${property.garages}",
                                        style: _textParagraphStyle,
                                      ),
                                    ) // garages
                                  ],
                                ),
                              ),
                              Container(height: 32),
                              Container(height: 32),
                            ]),
                            TableRow(children: <Widget>[
                              Container(
                                  child: Text(
                                "Bedroom",
                                style: _textParagraphStyle,
                              )),
                              Container(height: 32),
                              Container(
                                  child: Text(
                                "Garages",
                                style: _textParagraphStyle,
                              )),
                              Container(height: 32),
                              Container(height: 32),
                            ]),
                          ]),
                    ],
                  )),
                ),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Description"),
                    Html(
                      data: property.description,
                      defaultTextStyle: _textDescStyle,
                    ),
                  ],
                )),
                Divider(),
                Container(
                    height: 260,
                    width: MediaQuery.of(context).size.width,
                    child: MapSample(
                      lat: parseDouble(property.lat),
                      lng: parseDouble(property.lng),
                      address: property.address,
                    )),
                Divider(),
                Container(
                    child: Column(children: [
                  Text("Contact Agent"),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: MyPrimaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: MyPrimaryColor, spreadRadius: 1),
                                ],
                              ),
                              child: Image(
                                height: 60,
                                width: 60,
                                fit: BoxFit.fitHeight,
                                image: AssetImage('assets/images/banner.png'),
                              )),
                        ),
                        Spacer(),
                        Column(
                          children: [Text("Kudou"), Text("View agent profile")],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: MyPrimaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: MyPrimaryColor, spreadRadius: 1),
                                ],
                              ),
                              child: FlatButton(
                                  onPressed: () {
                                    call("tel:21213123123");
                                  },
                                  child: Icon(
                                    Icons.message,
                                    color: Colors.white,
                                  ))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: MyPrimaryColor, spreadRadius: 1),
                                ],
                              ),
                              child: FlatButton(
                                  onPressed: () {
                                    call("tel:21213123123");
                                  },
                                  child: Icon(
                                    Icons.call,
                                    color: MyPrimaryColor,
                                  ))),
                        )
                      ])
                ]))
              ]),
            ),
          ),
        );
      },
    );
  }
}

void call(String url) async {
  if (await UrlLauncher.canLaunch(url)) {
    await UrlLauncher.launch(url);
  } else {
    print("Not able to call this url");
  }
}

void call2(String url) {
  UrlLauncher.launch(url);
}

double parseDouble(String str) {
  try {
    return double.parse(str);
  } catch (e) {
    return 34.0;
  }
}
