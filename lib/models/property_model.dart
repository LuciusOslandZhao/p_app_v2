class PropertyModel {
  int id;
  String title;
  String description;
  PropertyMeta propertyMeta;
  List imageUrls;
  PropertyModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title']==null?"No content":json['title']['rendered'];
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

  String toString(){
    return "$address;$title;$bathrooms;$bedrooms;$garages;$zipcode;$lat;$lng;$description;";
  }

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