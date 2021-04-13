import 'package:flutter/material.dart';
import 'package:p_app_v2/models/app_state_model.dart';
import 'package:p_app_v2/models/property_model.dart';
import 'package:provider/provider.dart';

class TestLoading extends StatefulWidget {
  final PropertyModel property;

  const TestLoading({Key key, this.property}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TestLoading(property: property);
}

class _TestLoading extends State<TestLoading> {
  final PropertyModel property;
  _TestLoading({this.property});



  

  @override
  Widget build(BuildContext context) {
  return Consumer<AppState>(builder: (ctx, model, idx) {
    return  Image.network(
                property.imageUrls[0],
              );
              });
              // : Center(child: CircularProgressIndicator(
              //   backgroundColor: Colors.blue,
              //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              // )
     
  
    // Image.network(
    //   property.imageUrls[0],
    //   fit: BoxFit.cover,
    //   loadingBuilder: (BuildContext context, Widget child,
    //       ImageChunkEvent loadingProgress) {
    //     if (loadingProgress == null) return child;
    //     return Center(
    //       child: CircularProgressIndicator(
    //         value: loadingProgress.expectedTotalBytes != null
    //             ? loadingProgress.cumulativeBytesLoaded /
    //                 loadingProgress.expectedTotalBytes
    //             : 0,
    //       ),
    //     );
    //   },
    // );
  }
}
