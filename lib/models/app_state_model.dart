import 'package:flutter/foundation.dart';
import 'package:p_app_v2/data/data_fetch.dart';
import 'package:p_app_v2/models/agent_model.dart';
import 'package:p_app_v2/models/property_model.dart';

class AppState with ChangeNotifier {
// constructor
  AppState() {
    loadHouses();
  }
// data
  bool loading = true;
  var houseOne;
  List<PropertyModel> canberryHouses;
  List<PropertyModel> favouriteList;
  List<PropertyModel> items;
  List<PropertyModel> searchPropertyList;
  List<PropertyModel> searchListData;
// getters
  List<PropertyModel> get houses => canberryHouses;
  List<PropertyModel> get favourites => favouriteList;
  bool get load => loading;
  List<PropertyModel> get pickList => items;

  bool ifFavouriedById(int id) {
    for (var elem in favourites)
      if (elem.id == id) {
        return true;
      }
    return false;
  }

  void toggleFav(int id) {
    if (ifFavouriedById(id)) {
      removeFavById(id);
    } else {
      addFavById(id);
    }
    print(favouriteList);
    notifyListeners();
  }

  void addFavById(int id) {
    var elem = canberryHouses.firstWhere((element) => element.id == id);
    favouriteList.add(elem);
    notifyListeners();
  }

  void removeFavById(int id) {
    favouriteList.removeWhere((fav) => fav.id == id);
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
    canberryHouses = [];
    favouriteList = [];
    items = [];
    canberryHouses = await loadProperties();
    houseOne = canberryHouses[0];
    isLoaded();
    notifyListeners();
  }

  void filterSearchResults(String query) async {
    items = [];
    searchListData = [];
    if (query.isNotEmpty) {
      canberryHouses.forEach((item) => {
            if ((item.toString().toLowerCase()).contains(query.toLowerCase()))
              {searchListData.add(item)}
          });
      items = (searchListData);
    }
  }

  notifyListeners();
}
