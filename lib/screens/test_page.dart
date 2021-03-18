import 'package:flutter/material.dart';
import 'package:p_app_v2/models/app_state_model.dart';
import 'package:p_app_v2/widgets/property_card_vertical.dart';
import 'package:provider/provider.dart';

class TestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  FocusNode _focusNode;
  TextEditingController editingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
  }

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (ctx, model, idx) {
      return model.load
          ? Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            )
          : ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: new TextStyle(color: _getInputTextColor()),
                    focusNode: _focusNode,
                    onChanged: (value) {},
                    controller: editingController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: _getInputTextColor())),
                        labelText: "Search",
                        labelStyle: TextStyle(color: _getInputTextColor()),
                        hintText: "Search",
                        hintStyle: TextStyle(color: _getInputTextColor()),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        )),
                  ),
                ),
              ],
            );
    });
  }

  // Color _getContainerBackgroundColor() {
  //   return _focusNode.hasFocus ? Colors.blueGrey : Colors.white;
  // }

  // Color _getAppBarBackgroundColor() {
  //   return _focusNode.hasFocus ? Colors.green : Colors.red;
  // }

  Color _getInputTextColor() {
    return _focusNode.hasFocus ? Colors.blue : Colors.grey;
  }
}
