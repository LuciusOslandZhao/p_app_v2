import 'package:flutter/foundation.dart';

class AgentModel {
  int id;
  String fullName;
  Uri link;
  String content;
  int featured_media;
  String fave_agent_mobile;
  String fave_agent_email;
  List<String> fave_agent_language;
  String thumbnail_id;
  String fave_agent_logo;
  String imgUrl;

  AgentModel(
      {this.id,
      this.fullName,
      this.link,
      this.content,
      this.featured_media,
      this.fave_agent_mobile,
      this.fave_agent_email,
      this.fave_agent_language,
      this.thumbnail_id,
      this.fave_agent_logo});

  AgentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['title']['rendered'];
    link = Uri.parse(json['link']);
    content = json['content']['rendered'];
    featured_media = json['featured_media'];
    fave_agent_mobile =
        json['fave_agent_mobile'] != null ? json['fave_agent_mobile'][0] : "";
    fave_agent_email = json["fave_agent_email"];
    fave_agent_language = json['fave_agent_language'] == null
        ? [""]
        : List<String>.from(json['fave_agent_language']);
    thumbnail_id =
        json['_thumbnail_id'] == null ? "" : json['_thumbnail_id'][0];
    fave_agent_logo =
        json['fave_agent_logo'] == null ? "" : json['fave_agent_logo'][0];
  }

  void setImgUrl(String url) {
    imgUrl = url;
  }

  
}

class AgentTitleModel {
  String rendered;
}

class AgentContentModel {
  String rendered;
}