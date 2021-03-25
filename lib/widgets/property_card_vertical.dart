import 'package:flutter/material.dart';
import 'package:p_app_v2/common/constants.dart';
import 'package:p_app_v2/models/app_state_model.dart';
import 'package:p_app_v2/models/property_model.dart';
import 'package:p_app_v2/screens/property_detail_page.dart';
import 'package:p_app_v2/services/price_num_helper.dart';
import 'package:p_app_v2/widgets/fav_button.dart';
import 'package:p_app_v2/widgets/property_icon_info.dart';
import 'package:provider/provider.dart';

// import 'fav_star_button.dart';

class PropertyCardVertical extends StatefulWidget {
  final PropertyModel property;

  PropertyCardVertical({this.property});

  @override
  State<StatefulWidget> createState() =>
      _PropertyCardVerticalState(property: property);
}

class _PropertyCardVerticalState extends State<PropertyCardVertical> {
  final PropertyModel property;
  _PropertyCardVerticalState({this.property});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PropertyDetailPage(property: property)));
      },
      child: Card(
        child: Column(
          children: [
            Stack(children: [
              Padding(
                padding: EdgeInsets.all(0),
                child: Column(children: [
                  // Text("${property.images}"),
                  ShaderMask(
                                       shaderCallback: (rect) {
    return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [Colors.black, Colors.grey],
    ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
  },
  blendMode: BlendMode.dstIn,
                                      child: Image(
                      loadingBuilder: (ctx, w, event) {
                        if (event == null) {
                          return w;
                        }
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width * 2 / 3,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: event.expectedTotalBytes != null
                                  ? event.cumulativeBytesLoaded /
                                      event.expectedTotalBytes
                                  : null,
                            ),
                          ),
                        );
                      },
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 2 / 3,
                      image: NetworkImage("${property.imageUrls[0]}"),
                    ),
                  ),
                  // Text("${property.id}"),

                  // Text("${property.description}"),
                ]),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  // alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Consumer<AppState>(
                      builder: (ctx, myModel, child) {
                        return FavouriteButton(
                          isFav: myModel.ifFavouriedById(property.id),
                          onPressed: () {
                            myModel.toggleFav(property.id);
                          },
                        );
                      },
                    ),
                  )),
              Positioned(
                bottom: 0,
                left: 0,
                // alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "${formatPriceNum(property.price)}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PropertyIconInfo(
                      size:20,
                        property: property,
                        imageColor: Colors.white,
                        textColor: Colors.white),
                  ))
            ]),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${property.title}",
                    
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${property.address}",
                    style: TextStyle(color: MySecondaryColor),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}

//  Positioned(

//              child: Text("${property.address}")),
