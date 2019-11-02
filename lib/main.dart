import 'package:flutter/material.dart';

import './itemManager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepOrange,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('App Bar'),
          ),
          body: Container(
            color: Theme.of(context).highlightColor,
            alignment: AlignmentDirectional.topStart,
            child: ItemManager(),
          )),
    );
  }
}
