// class PropertyModel {
//   int id;
//   String name;
//   String description;
//   List images;

//   PropertyModel({this.id, this.name, this.description, this.images});

  // HouseModel.fromJson(Map<String, dynamic> json)
  //     : id = json["id"],
  //       name = json["name"],
  //       description = json["description"];

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'name': name,
  //       'description': description,
  //     };

  // factory HouseModel.fromJson(Map<String, dynamic> parsedJson) {
  //   return HouseModel(
  //     id: parsedJson['id'],
  //     name: parsedJson['name'],
  //     description: parsedJson['description'],
  //     // images: parseImages(parsedJson['images'])
  //     images: parsedJson['images'] == null
  //         ? "Nothing"
  //         : parseImages(parsedJson['images']),
  //   );
  // }

//   PropertyModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     images = new List<ImageModel>();
//     json['images'].forEach((v) => {
//           if (v == "" || v == null)
//             {print("Null or empty value found.")}
//           else
//             {images.add(new ImageModel.fromJson(v))}
//         });
//   }

//   String toString(){
//     return "(id:$id,name:$name,desc:$description,)";
//   }
// }

// class ImageModel {
   
//    final int id;
//    final String src;
//    final String name;

//   ImageModel({this.id, this.src, this.name});


//   factory ImageModel.fromJson(Map<String, dynamic> parsedJson){
//     return ImageModel(
//       id: parsedJson['id'],
//       src: parsedJson['src'],
//       name: parsedJson['name'],
//     );
//   }

//   String toString(){
//     return "$src";
//   }

// }

class PropertyModel {
  int id;
  String description;
  PropertyMeta propertyMeta;
  List imageUrls;
  PropertyModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    description = json['content']==null?"No content":json['content']['rendered'];
    propertyMeta = PropertyMeta.fromJson(json['property_meta']);
  }

  void setImageUrls(List list){
    imageUrls = list;
  }

  String get address => propertyMeta.fave_property_map_address;
  String get bathrooms => propertyMeta.fave_property_bathrooms;
  String get bedrooms => propertyMeta.fave_property_bedrooms;
  String get garages => propertyMeta.fave_property_garage;
  String get zipcode => propertyMeta.fave_property_zip;
  String get lat => propertyMeta.houzez_geolocation_lat;
  String get lng => propertyMeta.houzez_geolocation_long;

}

class PropertyMeta {

  String houzez_geolocation_lat;
  String houzez_geolocation_long;
  String houzez_total_property_views;
  String fave_property_map_address;
  String fave_property_zip;
  String fave_property_bedrooms;
  String fave_property_bathrooms;
  String fave_property_garage;
  List fave_property_images;


  PropertyMeta.fromJson(Map<String,dynamic> json){
    json = json==null?[]:json;
    houzez_geolocation_lat = json['houzez_geolocation_lat']==null? "":json['houzez_geolocation_lat'][0] ;
    houzez_geolocation_long = json['houzez_geolocation_long']==null?"":json['houzez_geolocation_long'][0];
    houzez_total_property_views = json['houzez_total_property_views']==null?"": json['houzez_total_property_views'][0];
    fave_property_map_address = json['fave_property_map_address']==null?"":json['fave_property_map_address'][0];
    fave_property_zip = json['fave_property_zip']==null?"":json['fave_property_zip'][0];
    fave_property_bedrooms = json['fave_property_bedrooms']==null?"":json['fave_property_bedrooms'][0];
    fave_property_bathrooms = json['fave_property_bathrooms']==null?"":json['fave_property_bathrooms'][0];
    fave_property_garage = json['fave_property_garage']==null?"":json['fave_property_garage'][0];
    fave_property_images = json['fave_property_images']==null?[]:json['fave_property_images'];
  }
}