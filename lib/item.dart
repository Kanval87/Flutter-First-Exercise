import 'package:flutter/material.dart';

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
