import 'package:flutter/material.dart';
import 'package:p_app_v2/models/app_state_model.dart';
import 'package:p_app_v2/screens/layout_template.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool dark = true;

  @override
  void initState() {
    dark = AppState().darkmode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (ctx, model, child) {
       return MaterialApp(
          theme: (model.themeData),
          home: MainLayoutTemplate(),
        );
      },
    );
  }
}

