import 'package:flutter/material.dart';

import './item.dart';

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

class ItemManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ItemManagerState();
  }
}

class _ItemManagerState extends State<ItemManager> {
  List<String> _items = ['Item 1'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String inputText = '';
    TextFormField textFormField = TextFormField(
      decoration: const InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'Enter Text',
          labelText: 'Name *'),
      controller: TextEditingController(
        text: '',
      ),
      onChanged: (value) {
        inputText = value;
      },
    );
    return Column(
      children: <Widget>[
        Container(
          alignment: AlignmentDirectional.centerStart,
          child: textFormField,
        ),
        Container(
          alignment: AlignmentDirectional.centerEnd,
          child: RaisedButton(
            onPressed: () {
              setState(() {
                _items.add(inputText);
                print('TextFormField value -> : ' + inputText);
                textFormField.controller.clear();
              });
            },
            child: Text('Press Me'),
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          alignment: AlignmentDirectional.centerEnd,
          child: RaisedButton(
            onPressed: () {
              setState(() {
                _items.clear();
                textFormField.controller.clear();
              });
            },
            child: Text('Clear list'),
            color: Theme.of(context).primaryColor,
          ),
        ),
        Column(
          children: _items.map((element) => Item(itemName: element)).toList(),
        )
      ],
    );
  }
}
