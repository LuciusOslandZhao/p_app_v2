import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:p_app_v2/data/data_fetch.dart';
import 'package:p_app_v2/data/sql/sql_helper.dart';
import 'package:p_app_v2/models/agent_model.dart';
import 'package:p_app_v2/models/property_model.dart';
import 'package:p_app_v2/models/property_status_model.dart';
import 'package:p_app_v2/models/property_type_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState with ChangeNotifier {
// constructor
  AppState() {
    loadHouses();
  }
// data
//
  SQLHelper sqlHelper;
  SharedPreferences prefs;
  bool _isLogin = false;
  bool loading = true;
  bool _hasNoMore = false;
  bool _loadingMore = false;
  bool _homeListloading = true;
  bool _darkmode = false;
  var houseOne;
  int loadMorePageIndex = 2;
  List<PropertyModel> _canberryHouses;
  List<PropertyModel> _favouriteList;
  List<PropertyModel> _items;
  List<PropertyModel> _searchListData;
  List<PropertyModel> _homepageList;
  List<PropertyTypeModel> _typeList;
  List<PropertyStatusModel> _statusList;
  List<AgentModel> _agents;
// getters

  bool get darkmode => _darkmode;
  bool get loadingMore => _loadingMore;
  bool get homeListLoading => _homeListloading;
  bool get isLogin => _isLogin;
  bool get load => loading;
  bool get hasNoMore => _hasNoMore;
  List<PropertyModel> get favourites => _favouriteList;
  List<PropertyModel> get houses => _canberryHouses;
  List<PropertyModel> get pickList => _items;
  List<PropertyModel> get homepageList => _homepageList;
  List<PropertyTypeModel> get types => _typeList;
  List<PropertyStatusModel> get statuses => _statusList;
  List<AgentModel> get agents => _agents;

  AgentModel getAgentById(String id) {
    var res = _agents.firstWhere((element) => "${element.id}" == id,
        orElse: () => _agents[0]);
    return res == null
        ? AgentModel(
            id: 0,
            fullName: "",
            link: Uri.parse('https://www.google.com'),
            content: "",
            featured_media: 0,
            fave_agent_language: ["0", "1"],
            thumbnail_id: "0",
            fave_agent_logo: "1")
        : res;
  }

  bool ifFavouriedById(int id) {
    for (var elem in favourites)
      if (elem.id == id) {
        return true;
      }
    return false;
  }

  TextStyle whiteText() {
    return TextStyle(color: Colors.black);
  }

  final darkTheme = ThemeData(
    primarySwatch: Colors.lightBlue,
    primaryColor: Color(0xFF212121),
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );

  ThemeData light = ThemeData(
      textTheme: TextTheme()
          .apply(bodyColor: Colors.black, displayColor: Colors.black),
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Colors.white,
      backgroundColor: Colors.white,
      primaryColor: Colors.white);
  ThemeData dark = ThemeData(
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.white),
      ).apply(bodyColor: Colors.white, displayColor: Colors.white),
      canvasColor: Colors.black,
      scaffoldBackgroundColor: Colors.black,
      backgroundColor: Colors.black,
      primaryColor: Colors.black);
  ThemeData get themeData {
    print('excuted get themedata');
    return _darkmode ? darkTheme : lightTheme;
  }

  final iconHeight = 30.00;
  final iconWidth = 30.00;

  Image get bathroomIcon {
    return darkmode
        ? Image(
            width: iconWidth,
            height: iconHeight,
            fit: BoxFit.fill,
            color: Colors.white,
            image: AssetImage('assets/images/bathroom.png'),
          )
        : Image(
            width: iconWidth,
            height: iconHeight,
            color: Colors.black,
            fit: BoxFit.fill,
            image: AssetImage('assets/images/bathroom.png'),
          );
  }

  Image get bedroomIcon {
    return darkmode
        ? Image(
            width: iconWidth,
            height: iconHeight,
            fit: BoxFit.fill,
            color: Colors.white,
            image: AssetImage('assets/images/bedroom.png'),
          )
        : Image(
            width: iconWidth,
            height: iconHeight,
            color: Colors.black,
            fit: BoxFit.fill,
            image: AssetImage('assets/images/bedroom.png'),
          );
  }

  Image get garageIcon {
    return darkmode
        ? Image(
            width: iconWidth,
            height: iconHeight,
            fit: BoxFit.fill,
            color: Colors.white,
            image: AssetImage('assets/images/car.png'),
          )
        : Image(
            width: iconWidth,
            height: iconHeight,
            fit: BoxFit.fill,
            color: Colors.black,
            image: AssetImage('assets/images/car.png'),
          );
  }

  Color get imageIconColor {
    return _darkmode ? Colors.white : Colors.black;
  }

  void login() {
    _isLogin = true;
    notifyListeners();
  }

  void logout() {
    _isLogin = false;
    notifyListeners();
  }

  void toggleDarkmode() async {
    _darkmode = !_darkmode;
    // StorageManager.setDarkmode(_darkmode);
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("darkmode", _darkmode);
    print("Now darkmode = $_darkmode");
    notifyListeners();
  }

  void toggleFav(int id) {
    if (ifFavouriedById(id)) {
      removeFavById(id);
    } else {
      addFavById(id);
    }
    print(_favouriteList);
    notifyListeners();
  }

  void addFavById(int id) async {
    var elem = _canberryHouses.firstWhere((element) => element.id == id);
    _favouriteList.add(elem);
    // await sqlHelper.insertProperty(elem);
    notifyListeners();
  }

  void removeFavById(int id) async {
    _favouriteList.removeWhere((fav) => fav.id == id);
    // await sqlHelper.deleteFavProperty(id);
    notifyListeners();
  }

  void isLoaded() {
    loading = false;
    notifyListeners();
  }

  void isLoading() {
    loading = true;
    notifyListeners();
  }

  void isLoadingMore() {
    _loadingMore = true;
    notifyListeners();
  }

  void isLoadedMore() {
    _loadingMore = false;
    notifyListeners();
  }

  void loadSettings() async {
    prefs = await SharedPreferences.getInstance();
    // _darkmode =
    if (prefs.getBool('darkmode') == null) {
      _darkmode = false;
    } else {
      _darkmode = prefs.getBool('darkmode');
    }
    notifyListeners();
  }

  void loadHouses() async {
    sqlHelper = new SQLHelper();
    loadSettings();
    _canberryHouses = [];
    _favouriteList = [];
    // _favouriteList = await sqlHelper.loadFavProperties();
    _items = [];
    _homepageList = [];
    _agents = [];
    _typeList = [];
    _typeList = await fetchTypes();
    _statusList = [];
    _statusList = await fetchStatus();
    _homepageList = await loadProperties(page: 1, perPage: 3);
    _canberryHouses = await loadProperties(page: 1, perPage: 5);
    // _canberryHouses = await loadProperties(all: true);
    _agents = await loadAgents();
    // houseOne = _canberryHouses[0];
    isLoaded();
    _homeListloading = false;
    print("");
    print(_typeList);
    print(_statusList);
    notifyListeners();
  }

  PropertyStatusModel getStatusById(int id) {
    var _res = _statusList.firstWhere(
      (element) => element.id == id,
      orElse: () => _statusList[0],
    );
    return _res == null
        ? PropertyStatusModel(id: 0, link: "", name: "Not Set")
        : _res;
  }

  PropertyTypeModel getTypeById(int id) {
    var _res = _typeList.firstWhere((element) => element.id == id,
        orElse: () => _typeList[0]);
    return _res == null
        ? PropertyTypeModel(id: 0, link: "", name: "Not Set")
        : _res;
  }

  void filterSearchResults(String query) async {
    _items = [];
    _searchListData = [];
    if (query.isNotEmpty) {
      _canberryHouses.forEach((item) => {
            if ((item.toString().toLowerCase()).contains(query.toLowerCase()))
              {_searchListData.add(item)}
          });
      _items = (_searchListData);
    }
    notifyListeners();
  }

  void setHasNoMore(bool value) {
    _hasNoMore = value;
    notifyListeners();
  }

  void loadMore() async {
    if (_loadingMore) {
      setHasNoMore(false);
      return;
    }
    print('loading more');
    isLoadingMore();
    List<PropertyModel> list_ =
        await loadProperties(page: loadMorePageIndex, perPage: 5);
    print(list_);

    setHasNoMore(list_.length<5);
    if(_loadingMore){
      setHasNoMore(false);
    }
    
    _canberryHouses.addAll(list_);
    loadMorePageIndex++;
    isLoadedMore();
    setHasNoMore(list_.length < 5);
    notifyListeners();
  }
}
