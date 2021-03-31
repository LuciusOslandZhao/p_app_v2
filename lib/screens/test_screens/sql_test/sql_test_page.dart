import 'package:flutter/material.dart';
import 'package:p_app_v2/models/app_state_model.dart';
import 'package:provider/provider.dart';

class SQLTestPage extends StatefulWidget {
  @override
  _SQLTestPageState createState() => _SQLTestPageState();
}

class _SQLTestPageState extends State<SQLTestPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:[
          Row(children: [
            Expanded(child: Consumer<AppState>(
              builder: (ctx,model,child){
                return ListView(
                  children: [
                    for(var item )
                  ],
                );
              },
            )
            )
          ],),
          Row(children: [

          ],)
        ]
      ),
    );
  }
}