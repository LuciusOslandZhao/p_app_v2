import 'package:flutter/material.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

class GoogleMapsWidget extends StatefulWidget {
  final address;

  const GoogleMapsWidget({Key key, this.address}) : super(key: key);
  @override
  GoogleMapsWidgetState createState() =>
      GoogleMapsWidgetState(address: address);
}

class GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  final address;
  String maps;

  GoogleMapsWidgetState({this.address});
  @override
  void initState() {
    super.initState();
    maps =
        '<html lang="en"><head><meta charset="UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Document</title></head><body><iframe width="100%" height="100%" style="border:0" loading="lazy" allowfullscreen src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCXHxN1Jd-3wYZUrPq0zIRe-t52puaGR2U &q=${address}"></iframe></body></html>';
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      
      initialUrl: Uri.dataFromString(maps, mimeType: 'text/html').toString(),
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
