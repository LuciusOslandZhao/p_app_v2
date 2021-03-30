import 'package:flutter/material.dart';
import 'package:p_app_v2/common/constants.dart';
import 'package:p_app_v2/models/app_state_model.dart';
import 'package:p_app_v2/models/property_model.dart';
import 'package:p_app_v2/screens/property_detail_page.dart';
import 'package:p_app_v2/widgets/fav_button.dart';
import 'package:provider/provider.dart';

class ListCard extends StatefulWidget {
  final PropertyModel property;

  const ListCard({Key key, this.property}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListCardState(property: property);
}

class _ListCardState extends State<ListCard> {
  final PropertyModel property;

  _ListCardState({this.property});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => PropertyDetailPage(property: property)));
      },
      child: Card(
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image(
                  image: NetworkImage(property.imageUrls[0]),
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                       width: MediaQuery.of(context).size.width  * 2 / 3,
                         height: MediaQuery.of(context).size.width * 1.5 / 3,
                      child: LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          MyPrimaryColor
                        ),
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  },
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.width * 1.5 / 3,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.width * 1.5 / 3,
                width: MediaQuery.of(context).size.width * 2 / 3,
                decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.grey.withOpacity(0.0),
                          Colors.grey.withOpacity(0.5),
                        ],
                        stops: [
                          0.0,
                          0.9
                        ])),
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Consumer<AppState>(
                    builder: (ctx, myModel, child) {
                      return FavouriteButton(
                        isFav: myModel.ifFavouriedById(property.id),
                        onPressed: () {
                          myModel.toggleFav(property.id);
                        },
                      );
                    },
                  )),
              Positioned(
                left: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${property.title}",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Text(
                          "${property.address}",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ]),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }

  // void toggleFavProperty(AppState app, int id) {
  //   setState(() {
  //     app.toggleFav(id);
  //   });
  // }
}
