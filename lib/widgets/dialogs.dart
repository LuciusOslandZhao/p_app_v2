import 'package:flutter/material.dart';
import 'package:p_app_v2/common/constants.dart';
import 'package:p_app_v2/models/app_state_model.dart';


final logo = Image.asset("assets/images/logo_with_title_large.png");
  TextEditingController _textFieldController = TextEditingController();


Future<void> ShowMyDialog(AppState app, BuildContext context) async {
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


  
  Future<void> ShowLogoutDialog(AppState app, BuildContext context) async {
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
