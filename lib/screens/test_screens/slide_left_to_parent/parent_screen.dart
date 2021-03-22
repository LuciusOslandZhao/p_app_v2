import 'package:flutter/material.dart';
import 'package:p_app_v2/screens/test_screens/slide_left_to_parent/child_screen.dart';

class TestParentScrollScreen extends StatefulWidget {
  @override
  _TestParentScrollScreenState createState() => _TestParentScrollScreenState();
}

class _TestParentScrollScreenState extends State<TestParentScrollScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, idx) {
            return ListTile(
              title: Text("Demo Page $idx"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DemoScrollChildScreen(index: idx)));
              },
            );
          }),
    );
  }
}
