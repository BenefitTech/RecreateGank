import 'package:flutter/material.dart';
import 'pages/Application.dart';
import 'common/GlobalConfig.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '干货集中营模仿',
      theme: ThemeData(
        primarySwatch: GlobalConfig.colorPrimary,
      ),
      home: Application(),
    );
  }
}
