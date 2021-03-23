import 'package:flutter/material.dart';
import 'package:p_app_v2/screens/browse_list_page.dart';
import 'package:p_app_v2/screens/fav_list_page.dart';
import 'package:p_app_v2/screens/settings_page.dart';
import 'package:p_app_v2/screens/test_page.dart';
import 'package:p_app_v2/screens/test_screens/slide_left_to_parent/parent_screen.dart';

class MainLayoutTemplate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainLayoutTemplateState();
}

class _MainLayoutTemplateState extends State<MainLayoutTemplate> {
  int _currentIndex;
  List screens = [
    // TestParentScrollScreen(),
    TestPage(),
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
    return Theme(
      data: ThemeData(primaryColor: Colors.white),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Canberry"),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: screens[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: changeTab,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_border_outlined), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: ""),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.person_outline), label: ""),
          ],
        ),
      ),
    );
  }

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
