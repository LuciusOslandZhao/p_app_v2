import 'package:flutter/material.dart';

class TestLoadingWidget extends StatefulWidget {
  final Widget widget_;
  final bool load_;
  const TestLoadingWidget({Key key, this.widget_, this.load_})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TestLoadingWidget(widget_: widget_);
}

class _TestLoadingWidget extends State<TestLoadingWidget> {
  Widget widget_;
  _TestLoadingWidget({this.widget_});

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
    super.dispose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.load_
        ? Center(
            child: CircularProgressIndicator(
            backgroundColor: Colors.blue,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ))
        : widget_;
  }
}
