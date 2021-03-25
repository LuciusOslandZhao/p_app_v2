import 'package:flutter/material.dart';
import 'package:p_app_v2/common/constants.dart';
import 'package:p_app_v2/models/app_state_model.dart';
import 'package:p_app_v2/screens/browse_list_page.dart';
import 'package:p_app_v2/screens/fav_list_page.dart';
import 'package:p_app_v2/screens/home_page.dart';
import 'package:p_app_v2/screens/settings_page.dart';
import 'package:p_app_v2/screens/test_screens/test_lifecycle.dart';
import 'package:provider/provider.dart';

class MainLayoutTemplate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainLayoutTemplateState();
}

class _MainLayoutTemplateState extends State<MainLayoutTemplate> {
  int _currentIndex;
  List screens = [
    // TestParentScrollScreen(),
    HomePage(),
    // TestLifeCycle(),
    BrowseListPage(),
    FavouriteListPage(),
    SettingsPage()
  ];

  @override
  void initState() {
    _currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (ctx,model,child){
      return Theme(
      data: model.themeData,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          toolbarHeight: 120,
          title: 
          Center(
            child: Image(
              height: 120 ,
              fit: BoxFit.contain,
              image: AssetImage("assets/images/logo_with_title_large.png"),),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: screens[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: changeTab,
          selectedItemColor: MyPrimaryColor,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined), label: "List"),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_border_outlined), label: "Save"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: "Me"),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.person_outline), label: ""),
          ],
        ),
      ),
    );
    },);
  }

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
