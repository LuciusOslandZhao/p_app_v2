import 'package:flutter/material.dart';

class DemoScrollChildScreen extends StatefulWidget {

  final int index;

  const DemoScrollChildScreen({Key key, this.index}) : super(key: key);

  @override
  _DemoScrollChildScreenState createState() => _DemoScrollChildScreenState(index:index);
}

class _DemoScrollChildScreenState extends State<DemoScrollChildScreen> {

  final int index;

  _DemoScrollChildScreenState({this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: GestureDetector(
         onHorizontalDragEnd: (details) {  
          // Note: Sensitivity is integer used when you don't want to mess up vertical drag
          int sensitivity = 0;
          if (details.primaryVelocity > sensitivity) {
              // Right Swipe
          } else if(details.primaryVelocity < -sensitivity){
              //Left Swipe
              Navigator.pop(context);
          }
      },
        child: Center(child: 
        Text("This is $index child page, left slide to go back")
        ,),
        
      ),
    );
  }
}