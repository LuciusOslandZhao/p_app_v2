import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:p_app_v2/data/data_fetch.dart';
import 'package:p_app_v2/models/property_model.dart';
import 'package:p_app_v2/models/property_type_model.dart';

class AppState with ChangeNotifier {
// constructor
  AppState() {
    loadHouses();
  }
// data
bool _isLogin = false;
  bool loading = true;
  bool _homeListloading = true;
  bool _darkmode = false;
  var houseOne;
  List<PropertyModel> _canberryHouses;
  List<PropertyModel> _favouriteList;
  List<PropertyModel> _items;
  List<PropertyModel> _searchListData;
  List<PropertyModel> _homepageList;
  List<PropertyTypeModel> _typeList;
// getters

  bool get darkmode => _darkmode;
  bool get homeListLoading => _homeListloading;
  bool get isLogin => _isLogin;
  bool get load => loading;
  List<PropertyModel> get favourites => _favouriteList;
  List<PropertyModel> get houses => _canberryHouses;
  List<PropertyModel> get pickList => _items;
  List<PropertyModel> get homepageList => _homepageList;

  bool ifFavouriedById(int id) {
    for (var elem in favourites)
      if (elem.id == id) {
        return true;
      }
    return false;
  }

ThemeData light = ThemeData(backgroundColor: Colors.white,primaryColor: Colors.white);
ThemeData dark = ThemeData(backgroundColor: Colors.black, primaryColor: Colors.black);
ThemeData get themeData {
print('excuted get themedata');
return _darkmode? dark:light;
} 

void login(){
  _isLogin = true;
  notifyListeners();
}

void logout(){
  _isLogin = false;
  notifyListeners();
}

  void toggleDarkmode(){
    _darkmode = !_darkmode;
    print("Now darkmode = $darkmode");
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

  void addFavById(int id) {
    var elem = _canberryHouses.firstWhere((element) => element.id == id);
    _favouriteList.add(elem);
    notifyListeners();
  }

  void removeFavById(int id) {
    _favouriteList.removeWhere((fav) => fav.id == id);
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

  void loadHouses() async {
    _canberryHouses = [];
    _favouriteList = [];
    _items = [];
    _homepageList = [];
    _homepageList = await loadProperties(page:1,perPage: 3);
    _canberryHouses = await loadProperties(all: true);
    // houseOne = _canberryHouses[0];
    isLoaded();
    _homeListloading = false;
    notifyListeners();
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
  }

  notifyListeners();

  void loadMore(int currentPage) async {
    print('loading more');
    var list_ = await loadProperties(page:currentPage);
    print(list_);
    // var newList_ = [..._canberryHouses,...list_];
    list_.forEach((element) {_canberryHouses.add(element) ;});
    // _canberryHouses = newList_;
    notifyListeners();
  }
}
