import 'package:flutter/material.dart';
import 'package:p_app_v2/common/constants.dart';
import 'package:p_app_v2/models/app_state_model.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List menus = [
    {"title": "Login"},
    {"title": "Logout"}
  ];

final logo = Image.asset("assets/images/logo_with_title_large.png");
  TextEditingController _textFieldController = TextEditingController();

  Future<void> _showMyDialog(AppState app) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      //this means the user must tap a button to exit the Alert Dialog
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Placeholder(color:MyPrimaryColor ,),
          title: Center(
            child: logo,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                    controller: _textFieldController,

                    // obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email, color: MyPrimaryColor),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: MySecondaryColor, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: MyPrimaryColor, width: 1.0),
                      ),
                      hintText: "Eamil",
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: TextField(
                      decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: MyPrimaryColor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: MySecondaryColor, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyPrimaryColor, width: 1.0),
                    ),
                    hintText: "Password",
                  )),
                )
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Login'),
              onPressed: () {
                print(_textFieldController.text);
                _textFieldController.clear();
                app.login();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Go Out'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showLogoutDialog(AppState app) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      //this means the user must tap a button to exit the Alert Dialog
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Placeholder(color:MyPrimaryColor ,),
          title: logo,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Sure logout?"),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                app.logout();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.vertical, children: [
      ListTile(
        title: Text("Darkmode"),
        trailing: Consumer<AppState>(
          builder: (ctx, model, child) {
            return Switch(
              activeColor: MyPrimaryColor,
              onChanged: (bool value) {
                model.toggleDarkmode();
              },
              value: model.darkmode,
            );
          },
        ),
      ),
      Consumer<AppState>(builder: (ctx, model, child) {
        return ListTile(
            // leading: Text("Leading"),
            title: model.isLogin ? Text("Logout") : Text("Login"),
            onTap: model.isLogin
                ? () {
                    _showLogoutDialog(model);
                  }
                : () {
                    _showMyDialog(model);
                  },
            // subtitle: Text("SubTitle"),
            trailing: Icon(Icons.arrow_forward_ios));
      }),
    ]
        // ListTile.divideTiles(
        //   context: context,
        //   tiles: [
        //         SwitchListTile(
        //   title: const Text('Lights'),
        //   value: true,
        //   onChanged: (bool value) {

        //   },
        //   secondary: const Icon(Icons.lightbulb_outline),
        // ),

        // ListTile(
        //   title: Text("Darkmode"),
        //   trailing: Text("data"),
        // ),
        //     for (var menu in menus)
        //       ListTile(
        //           // leading: Text("Leading"),
        //           title: Text("${menu['title']}"),
        //           // subtitle: Text("SubTitle"),
        //           trailing: Icon(Icons.arrow_forward_ios)),
        //   ],
        // )

        );
  }
}
