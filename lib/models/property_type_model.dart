class PropertyTypeModel {
  int id;
  String link;
  String name;

  PropertyTypeModel({
    this.id,
    this.link,
    this.name
  });

  PropertyTypeModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    link = json['link'];
    name = json['name'];
  }
}