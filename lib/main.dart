import 'package:flutter/material.dart';

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
            child: Item(),
          )),
    );
  }
}

class Item extends StatelessWidget {
  Item({this.itemName = 'item'});

  String itemName;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          alignment: AlignmentDirectional.center,
          child: Text(
            this.itemName,
            textScaleFactor: 3,
            style: TextStyle(
                color: Theme.of(context).accentColor,
                decorationStyle: TextDecorationStyle.double),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          alignment: AlignmentDirectional.center,
          child: Image.asset(
            'assets/drstrange.jpg',
            colorBlendMode: BlendMode.lighten,
            fit: BoxFit.fitWidth,
          ),
        )
      ],
    );
  }
}
