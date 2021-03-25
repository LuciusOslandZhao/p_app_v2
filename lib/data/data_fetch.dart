import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:p_app_v2/models/agent_model.dart';
import 'package:p_app_v2/models/property_model.dart';

List<PropertyModel> parseHouses(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<PropertyModel>((json) => PropertyModel.fromJson(json))
      .toList();
}

Future<List<PropertyModel>> fetchHouses() async {
  var client = new http.Client();
  final response = await client.get(Uri.parse(
      'https://www.canberry.property/app/wp-json/wc/v1/products/?consumer_key=ck_a7e5b7611560c39a2063f3c8dfc700f045298ef4&consumer_secret=cs_10328d84cafa9e0cbe24b855a9eb1ab7992d9a29'));

  // print(response.body);

  if (response != null && response.statusCode == 200) {
// ignore: non_constant_identifier_names
    List houses_ = jsonDecode(response.body);
    return houses_.map((h) => PropertyModel.fromJson(h)).toList();
  } else {
    return [];
  }
}

// ignore: non_constant_identifier_names
final String BaseURL2 = "https://www.canberryproperties.com.au/wp-json/wp/v2";
final String FirstPageOfFive =
    "https://canberryproperties.com.au/wp-json/wp/v2/properties?page=1&per_page=5";
final String BaseURL = "https://jsonplaceholder.typicode.com";

Future<http.Response> fetchData(String endpoint) async {
  print("$BaseURL/$endpoint");
  http.Client client = new http.Client();
  return await client.get(Uri.parse("$BaseURL/$endpoint"));
}

Future<List<AgentModel>> loadAgents() async {
  http.Client client = new http.Client();
  final _response = await client.get(Uri.parse("$BaseURL2/agents"));
  if (_response != null && _response.statusCode == 200) {
    List users = json.decode(_response.body);
    print(users);
    var resUsers_ = users.map((user) => AgentModel.fromJson(user)).toList();
    for (var _user in resUsers_) {
      var url = await fetchMediaUrl("${_user.featured_media}");
      _user.setImgUrl(url);
      _user.loaded();
    }
    return resUsers_;
  } else {
    throw Exception("No data fetched.");
  }
}

Future<List<PropertyModel>> loadProperties(
    {int page = 1, int perPage = -1, bool all = false}) async {
  http.Client client = new http.Client();
  // final _response = await client.get(Uri.parse("$BaseURL2/properties"));
  final _response = all
      ? await client.get(Uri.parse("$BaseURL2/properties"))
      : await client
          .get(Uri.parse("$BaseURL2/properties?page=$page&per_page=$perPage"));
  // final _response = await client.get(Uri.parse("$BaseURL2/properties"));
  try {
    if (_response != null && _response.statusCode == 200) {
      List properties = json.decode(_response.body);
      print(properties);
      var resProperties_ =
          properties.map((p) => PropertyModel.fromJson(p)).toList();
      for (var _p in resProperties_) {
        List tempUrls = [];
        if (_p.propertyMeta.fave_property_images.isEmpty) {
          tempUrls
              .add("https://via.placeholder.com/475?text=Preparing%20Pictures");
        } else {
          for (var _imgId in _p.propertyMeta.fave_property_images) {
            var _imgUrl = await fetchMediaUrl("$_imgId");
            tempUrls.add(_imgUrl);
          }
        }
        _p.setImageUrls(tempUrls);
      }
      return resProperties_;
    } else {
      return [];
    }
  } catch (e) {
    print(e);
    return [];
  }
}

Future<String> fetchMediaUrl(String mediaId) async {
  http.Client client = new http.Client();
  final _res = await client.get(Uri.parse("$BaseURL2/media/$mediaId"));

  if (_res != null && _res.statusCode == 200) {
    String mediaUrl = json.decode(_res.body)['source_url'];
    print(mediaUrl);
    return mediaUrl;
  } else {
    return randomPicId();
  }
}

String randomPicId() {
  Random rnd;
  int min = 1000;
  int max = 1009;
  rnd = new Random();
  int r = min + rnd.nextInt(max - min);
  print("$r is in the range of $min and $max");
  return "https://picsum.photos/id/$r/300/200";
}
