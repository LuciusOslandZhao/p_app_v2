import 'package:flutter/material.dart';

class TestLifeCycle extends StatefulWidget {
  @override
  _TestLifeCycleState createState() {
    print("createState called.");
    return _TestLifeCycleState();
  }
}

class _TestLifeCycleState extends State<TestLifeCycle> {
  initState() {
    print("initState called.");
    super.initState();
  }

  didChangeDependencies() {
    print("didChangeDependencies called.");
    super.didChangeDependencies();
  }

  didUpdateWidget(Widget old) {
    print("didUpdateWidget called.");
    super.didUpdateWidget(old);
  }

  deactivate() {
    print("deactive called.");
    super.deactivate();
  }

  dispose() {
    print("dispose called.");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      print("setState called.");
    });
    return Center(
      child: Column(children: [
        TextButton(
          onPressed: () {
            initState();
          },
          child: Text("initState"),
        ),
       
        TextButton(
          onPressed: () {
            didChangeDependencies();
          },
          child: Text("didChangeDependencies"),
        ),
        TextButton(
          onPressed: () {
            didUpdateWidget(null);
          },
          child: Text("didUpdateWidget"),
        ),
        TextButton(
          onPressed: () {
            deactivate();
          },
          child: Text("deactivate"),
        ),
        TextButton(
          onPressed: () {
            dispose();
          },
          child: Text("dispose"),
        ),
      ]),
    );
  }
}
