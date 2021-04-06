import 'package:flutter/material.dart';
import 'package:p_app_v2/common/constants.dart';
import 'package:p_app_v2/models/app_state_model.dart';
import 'package:p_app_v2/screens/search_page.dart';
import 'package:p_app_v2/widgets/category_card_slider_horizontal.dart';
import 'package:p_app_v2/widgets/list_card_slider_horizontal.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      return model.homeListLoading
          ? Center(
              child: myProgressIndicator,
            )
          : Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Consumer<AppState>(
                        builder: (ctx, model, child) {
                          return TextField(
                            onTap: () {
                              if (!_focusNode.hasPrimaryFocus) {
                                _focusNode.unfocus();
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SearchPage(
                                          search: editingController.text)));
                            },
                            style: new TextStyle(color: _getInputTextColor()),
                            focusNode: _focusNode,
                            onChanged: (value) {
                              model.filterSearchResults(value);
                            },
                            controller: editingController,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                        color: _getInputTextColor())),
                                labelText: "Search",
                                labelStyle:
                                    TextStyle(color: _getInputTextColor()),
                                hintText: "Search",
                                hintStyle:
                                    TextStyle(color: _getInputTextColor()),
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                )),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Categories",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    CategoryCardSlider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Feature Properties",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    ListCardSlider(),
                  ],
                ),
              ),
            );
    });
  }

  Color _getInputTextColor() {
    return _focusNode.hasFocus ? Colors.blue : Colors.grey;
  }
}
