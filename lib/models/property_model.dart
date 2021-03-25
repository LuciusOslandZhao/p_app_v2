class PropertyModel {
  int id;
  String title;
  String description;
  PropertyMeta propertyMeta;
  List imageUrls;


  PropertyModel({
    this.id,
    this.description,
    this.title,
    this.propertyMeta,
    this.imageUrls
  });


  PropertyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] == null ? "No content" : json['title']['rendered'];
    description =
        json['content'] == null ? "No content" : json['content']['rendered'];
    propertyMeta = PropertyMeta.fromJson(json['property_meta']);
  }

  void setImageUrls(List list) {
    imageUrls = list;
  }

String get price => propertyMeta.fave_property_price;
  String get address => propertyMeta.fave_property_map_address;
  String get bathrooms => propertyMeta.fave_property_bathrooms;
  String get bedrooms => propertyMeta.fave_property_bedrooms;
  String get garages => propertyMeta.fave_property_garage;
  String get zipcode => propertyMeta.fave_property_zip;
  String get lat => propertyMeta.houzez_geolocation_lat;
  String get lng => propertyMeta.houzez_geolocation_long;

  String toString() {
    return "$address;$title;$bathrooms;$bedrooms;$garages;$zipcode;$lat;$lng;$description;";
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "propertyMeta": propertyMeta.toMap(),
      "imageUrls":
          Map.fromIterable(imageUrls, key: (e) => e[0], value: (e) => e[1])
    };
  }

  PropertyModel fromMap(Map<String, dynamic> map){
    return new PropertyModel(
      id: map['id'],
      description: map['description'],
      title: map['title'],
      propertyMeta: new PropertyMeta.fromJson(map['propertyMeta']),
      imageUrls: List.from(map['imageUrls'])
    );
  }
}

class PropertyMeta {
  String houzez_geolocation_lat;
  String houzez_geolocation_long;
  String houzez_total_property_views;
  String fave_property_map_address;
  String fave_property_zip;
  String fave_property_price;
  String fave_property_bedrooms;
  String fave_property_bathrooms;
  String fave_property_garage;
  List   fave_property_images;

  PropertyMeta(
    {
  this.houzez_geolocation_lat,
  this.houzez_geolocation_long,
  this.houzez_total_property_views,
  this.fave_property_map_address,
  this.fave_property_price,
  this.fave_property_zip,
  this.fave_property_bedrooms,
  this.fave_property_bathrooms,
  this.fave_property_garage,
  this.fave_property_images,
    }
  );

  Map<String, dynamic> toMap() {
    return {
      "houzez_geolocation_lat": houzez_geolocation_lat,
      "houzez_geolocation_long": houzez_geolocation_long,
      "houzez_total_property_views": houzez_total_property_views,
      "fave_property_map_address": fave_property_map_address,
      "fave_property_zip": fave_property_zip,
      "fave_property_bedrooms": fave_property_bedrooms,
      "fave_property_bathrooms": fave_property_bathrooms,
      "fave_property_garage": fave_property_garage,
      "fave_property_images": Map.fromIterable(fave_property_images, key: (e)=>e[0],value:(e)=>e[1]),
    };
  }

   PropertyMeta fromMap(Map<String, dynamic> map){
    return new PropertyMeta(
  houzez_geolocation_lat:map['houzez_geolocation_lat'],
  houzez_geolocation_long:map['houzez_geolocation_long'],
  houzez_total_property_views:map['houzez_total_property_views'],
  fave_property_map_address:map['fave_property_map_address'],
  fave_property_zip:map['fave_property_zip'],
  fave_property_bedrooms:map['fave_property_bedrooms'],
  fave_property_bathrooms:map['fave_property_bathrooms'],
  fave_property_garage:map['fave_property_garage'],
  fave_property_images: List.from(map['fave_property_images']),
    );
  }

  PropertyMeta.fromJson(Map<String, dynamic> json) {
    json = json == null ? [] : json;
    houzez_geolocation_lat = json['houzez_geolocation_lat'] == null
        ? ""
        : json['houzez_geolocation_lat'][0];
    houzez_geolocation_long = json['houzez_geolocation_long'] == null
        ? ""
        : json['houzez_geolocation_long'][0];
    houzez_total_property_views = json['houzez_total_property_views'] == null
        ? ""
        : json['houzez_total_property_views'][0];
    fave_property_map_address = json['fave_property_map_address'] == null
        ? ""
        : json['fave_property_map_address'][0];
    fave_property_zip =
        json['fave_property_zip'] == null ? "" : json['fave_property_zip'][0];
    fave_property_price = json['fave_property_price']==null? "Contact Agent": json['fave_property_price'][0];
    
    fave_property_bedrooms = json['fave_property_bedrooms'] == null
        ? ""
        : json['fave_property_bedrooms'][0];
    fave_property_bathrooms = json['fave_property_bathrooms'] == null
        ? ""
        : json['fave_property_bathrooms'][0];
    fave_property_garage = json['fave_property_garage'] == null
        ? ""
        : json['fave_property_garage'][0];
    fave_property_images = json['fave_property_images'] == null
        ? []
        : json['fave_property_images'];
  }
}
