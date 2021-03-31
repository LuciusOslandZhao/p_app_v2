import 'dart:convert';

import 'agent_model.dart';

class PropertyModel {
  int id;
  String title;
  String description;
  PropertyMeta propertyMeta;
  List imageUrls;
  int featureMediaId;
  String featureMediaUrl;
  int statusId;
  int typeId;

  PropertyModel(
      {this.id,
      this.description,
      this.title,
      this.propertyMeta,
      this.imageUrls,
      this.statusId,
      this.typeId});

  PropertyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] == null ? "No content" : json['title']['rendered'];
    featureMediaId = json['featured_media'];

    description =
        json['content'] == null ? "No content" : json['content']['rendered'];
    propertyMeta = PropertyMeta.fromJson(json['property_meta']);

    statusId = json['property_status'][0];
    typeId = json['property_type'][0];
  }

  void setImageUrls(List list) {
    imageUrls = list;
  }

  void setFeatureUrl(String url) {
    featureMediaUrl = url;
  }

  String get price => propertyMeta.fave_property_price;
  String get address => propertyMeta.fave_property_map_address;
  String get bathrooms => propertyMeta.fave_property_bathrooms;
  String get bedrooms => propertyMeta.fave_property_bedrooms;
  String get garages => propertyMeta.fave_property_garage;
  String get zipcode => propertyMeta.fave_property_zip;
  String get lat => propertyMeta.houzez_geolocation_lat;
  String get lng => propertyMeta.houzez_geolocation_long;
  List get agentIds => propertyMeta.fave_agents;

  String toString() {
    return "$id;$address;$title;$bathrooms;$bedrooms;$garages;$price;$zipcode;$lat;$lng;$description;";
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "propertyMeta": jsonEncode(propertyMeta.toMap()),
      // "imageUrls": imageUrls.length<1?"": imageUrls.toString().replaceAll("[", "").replaceAll("]", ""),
      "imageUrls": jsonEncode(imageUrls),
    };
  }

  PropertyModel fromMap(Map<String, dynamic> map) {
    return new PropertyModel(
        id: map['id'],
        description: map['description'],
        title: map['title'],
        propertyMeta: new PropertyMeta().fromMap(jsonDecode(map['propertyMeta'])),
        imageUrls: map['imageUrls'].split(","));
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
  List fave_property_images;
  List fave_agents;

  PropertyMeta(
      {this.houzez_geolocation_lat,
      this.houzez_geolocation_long,
      this.houzez_total_property_views,
      this.fave_property_map_address,
      this.fave_property_price,
      this.fave_property_zip,
      this.fave_property_bedrooms,
      this.fave_property_bathrooms,
      this.fave_property_garage,
      this.fave_property_images,
      this.fave_agents});

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
      // "fave_property_images": fave_property_images.length<1?"": fave_property_images
      //     .toString()
      //     .replaceAll("[", "")
      //     .replaceAll("]", ""),

            "fave_property_images": jsonEncode(fave_property_images),
    };
  }

  PropertyMeta fromMap(Map<String, dynamic> map) {
    return new PropertyMeta(
      houzez_geolocation_lat: map['houzez_geolocation_lat'],
      houzez_geolocation_long: map['houzez_geolocation_long'],
      houzez_total_property_views: map['houzez_total_property_views'],
      fave_property_map_address: map['fave_property_map_address'],
      fave_property_zip: map['fave_property_zip'],
      fave_property_bedrooms: map['fave_property_bedrooms'],
      fave_property_bathrooms: map['fave_property_bathrooms'],
      fave_property_garage: map['fave_property_garage'],
      fave_property_images: map['fave_property_images'].split(","),
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
    fave_property_price = json['fave_property_price'] == null
        ? "Contact Agent"
        : json['fave_property_price'][0];

    fave_property_bedrooms = json['fave_property_bedrooms'] == null
        ? "0"
        : json['fave_property_bedrooms'][0];
    fave_property_bathrooms = json['fave_property_bathrooms'] == null
        ? "0"
        : json['fave_property_bathrooms'][0];
    fave_property_garage = json['fave_property_garage'] == null
        ? "0"
        : json['fave_property_garage'][0];
    fave_property_images = json['fave_property_images'] == null
        ? []
        : json['fave_property_images'];

    fave_agents = json['fave_agents'] == null ? [] : json['fave_agents'];
  }
}
