import 'package:flutter/material.dart';
import 'package:p_app_v2/common/constants.dart';
import 'package:p_app_v2/models/app_state_model.dart';
import 'package:p_app_v2/widgets/property_card_vertical.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  final String search;

  const SearchPage({Key key, this.search}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SearchPageState(search:search);
}

class _SearchPageState extends State<SearchPage> {
  FocusNode _focusNode;
  TextEditingController editingController = TextEditingController();
 String search;
 _SearchPageState({this.search});
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
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<AppState>(builder: (ctx, model, idx) {
        return model.load
            ? Center(
                child: myProgressIndicator,
              )
            : 
            Column(
              children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: new TextStyle(color: _getInputTextColor()),
                      focusNode: _focusNode,
                      onChanged: (value) {
                        // setState(() {
                        //   search = value;
                        // });
                        model.filterSearchResults(value);
                      },
                      controller: editingController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide:
                                  BorderSide(color: _getInputTextColor())),
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
              model.pickList.length>0?  Expanded(
                flex: 1,
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                     Column(
                                // scrollDirection: Axis.vertical,
                                children: [
                                    // if (model.pickList != null)
                                      for (var item in model.pickList)
                                        PropertyCardVertical(property: item),
                                  ])
                      ],
                    ),
                ):Expanded(
                  flex: 1,
                  // height: MediaQuery.of(context).size.height * 3/ 5,
                  child: Center(child: Text("No Results"))),
              ],
            );
      }),
    );
  }
  Color _getInputTextColor() {
    return _focusNode.hasFocus ? Colors.blue : Colors.grey;
  }
}
