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
TextStyle whiteText(){
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

  ThemeData light =
      ThemeData(
        textTheme: TextTheme().apply(
          bodyColor: Colors.black,
          displayColor: Colors.black
        ),

        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.white,
        backgroundColor: Colors.white, primaryColor: Colors.white);
  ThemeData dark =
      ThemeData(

        textTheme: TextTheme(

          bodyText1: TextStyle(color: Colors.white),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white
        ),
        canvasColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        backgroundColor: Colors.black, primaryColor: Colors.black);
  ThemeData get themeData {
    print('excuted get themedata');
    return _darkmode ? darkTheme : lightTheme;
  }

final iconHeight = 30.00;
final iconWidth = 30.00;


Image get bathroomIcon {
  return darkmode ? Image(
  width: iconWidth,
  height: iconHeight,
  fit: BoxFit.fill,
  color: Colors.white,
  image: AssetImage('assets/images/bathroom.png'),
):Image(
  width: iconWidth,
  height: iconHeight,
  color: Colors.black,
  fit: BoxFit.fill,
  image: AssetImage('assets/images/bathroom.png'),
);
}
Image get bedroomIcon {
return darkmode ? Image(
  width: iconWidth,
  height: iconHeight,
  fit: BoxFit.fill,
  color: Colors.white,
  image: AssetImage('assets/images/bedroom.png'),
):Image(
  width: iconWidth,
  height: iconHeight,
  color: Colors.black,
  fit: BoxFit.fill,
  image: AssetImage('assets/images/bedroom.png'),
);
}
Image get garageIcon {
return darkmode ? Image(
  width: iconWidth,
  height: iconHeight,
  fit: BoxFit.fill,
  color: Colors.white,

  image: AssetImage('assets/images/car.png'),
):Image(
  width: iconWidth,
  height: iconHeight,
  fit: BoxFit.fill,
  color: Colors.black,

  image: AssetImage('assets/images/car.png'),
);
}

Color get imageIconColor {
  
  return _darkmode ? Colors.white: Colors.black;
}
  void login() {
    _isLogin = true;
    notifyListeners();
  }

  void logout() {
    _isLogin = false;
    notifyListeners();
  }

  void toggleDarkmode() {
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
    _homepageList = await loadProperties(page: 1, perPage: 3);
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

    List<PropertyModel> list_ =
        await loadProperties(page: currentPage, perPage: 5);
    print(list_);
    // var newList_ = [..._canberryHouses,...list_];

    // _canberryHouses = newList_;
    _canberryHouses.addAll(list_);
    notifyListeners();
  }
}
