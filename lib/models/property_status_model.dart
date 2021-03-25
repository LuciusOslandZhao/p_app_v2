class PropertyStatusModel {
  int id;
  String link;
  String name;

  PropertyStatusModel({
    this.id,
    this.link,
    this.name
  });

  PropertyStatusModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    link = json['link'];
    name = json['name'];
  }
  
}