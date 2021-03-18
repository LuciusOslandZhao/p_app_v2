import 'package:flutter/foundation.dart';
import 'package:p_app_v2/data/data_fetch.dart';
import 'package:p_app_v2/models/property_model.dart';

class AppState with ChangeNotifier {
// constructor
  AppState() {
    loadHouses();
  }
// data
  bool loading = true;
  var houseOne;
  List canberryHouses;
  List favouriteList;
// getters
  List get houses => canberryHouses;
  List get favourites => favouriteList;
  bool get load => loading;



  bool ifFavouriedById(int id){
    for(var elem in favourites)
      if(elem.id==id){
        return true;
    }
    return false;
  }

void toggleFav(int id){
  if(ifFavouriedById(id)){
    removeFavById(id);
  }
  else {
    addFavById(id);
  }
  print(favouriteList);
  notifyListeners();
}

void addFavById(int id){
  var elem = canberryHouses.firstWhere((element) => element.id==id);
  favouriteList.add(elem);
  notifyListeners();
}
  void removeFavById(int id){
    favouriteList.removeWhere((fav) => fav.id==id);
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
    canberryHouses = await loadProperties();
    houseOne = canberryHouses[0];
    isLoaded();
    notifyListeners();
  }
}
