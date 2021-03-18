import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List menus = [
    {"title": "Dark Mode"},
    {"title": "Login"},
    {"title": "Logout"}
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: ListTile.divideTiles(context: context, tiles: [
        for (var menu in menus)
          ListTile(
              // leading: Text("Leading"),
              title: Text("${menu['title']}"),
              // subtitle: Text("SubTitle"),
              trailing: Icon(Icons.arrow_forward_ios))
      ]).toList(),
    );
  }
}
