// import 'package:flutter/material.dart';
// import 'package:p_app_v2/models/app_state_model.dart';
// import 'package:p_app_v2/models/property_model.dart';
// import 'package:p_app_v2/screens/property_detail_page.dart';
// import 'package:p_app_v2/models/app_state_model.dart';
// import 'package:p_app_v2/widgets/fav_button.dart';
// import 'package:provider/provider.dart';


// class PropertyCardVertical extends StatefulWidget {
//   final PropertyModel property;

//   PropertyCardVertical({this.property});

//   @override
//   State<StatefulWidget> createState() =>
//       _PropertyCardVerticalState(property: property);
// }

// class _PropertyCardVerticalState extends State<PropertyCardVertical> {
//   final PropertyModel property;
//   _PropertyCardVerticalState({this.property});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => PropertyDetailPage(property: property)));
//       },
//       child: Card(
//         child: Stack(children: [
//           Padding(
//             padding: EdgeInsets.all(8),
//             child: Column(children: [
//               // Text("${property.images}"),
              
//               Container(
//                 height: MediaQuery.of(context).size.width * 2 / 3,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(image: 
//                   NetworkImage("${property.imageUrls[0]}"),
//                   fit: BoxFit.cover,
//                   )
//                 ),
//               ),
//               // Text("${property.id}"),
//               Text("${property.address}"),
//               // Text("${property.description}"),
//             ]),
//           ),
//           Align(
//               alignment: Alignment.bottomRight,
//               child: Padding(
//                 padding: EdgeInsets.all(8),
//                 child: Consumer<AppState>(
//                   builder: (ctx, myModel, child) {
//                     return FavouriteButton(
//                       isFav: myModel.ifFavouriedById(property.id),
//                       onPressed: () {
//                         myModel.toggleFav(property.id);
//                       },
//                     );
//                   },
//                 ),
//               )),
//         ]),
//       ),
//     );
//   }

//   // void toggleFavProperty(AppState app, int id) {
//   //   setState(() {
//   //     app.toggleFav(property.id);
//   //   });
//   // }
// }



// // Image(
// //                   loadingBuilder: (ctx, w, event) {
// //                     if (event == null) {
// //                       return w;
// //                     }
// //                     return Container(
// //                       width: MediaQuery.of(context).size.width,
// //                       height: MediaQuery.of(context).size.width * 2/ 3,
// //                       child: Center(
// //                         child: CircularProgressIndicator(
// //                           value: event.expectedTotalBytes != null
// //                               ? event.cumulativeBytesLoaded /
// //                                   event.expectedTotalBytes
// //                               : null,
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                   width: MediaQuery.of(context).size.width,
// //                 height: MediaQuery.of(context).size.width * 2/ 3,

// //                   image: NetworkImage("${property.imageUrls[0]}"),
// //                   fit: BoxFit.cover,
// //                 ),