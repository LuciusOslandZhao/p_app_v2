import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import '';

class UserRegisterPage extends StatefulWidget {
  @override
  _UserRegisterPageState createState() => _UserRegisterPageState();
}

class _UserRegisterPageState extends State<UserRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children:[
          TextField(),
          TextField(),
          TextField(),
          TextField(),

        ]
      ),
      
    );
  }
}