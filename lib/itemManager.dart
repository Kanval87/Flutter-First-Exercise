import 'package:flutter/material.dart';

import './item.dart';

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
        Expanded(
          child: ItemList(),
        )
      ],
    );
  }
}

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  return ListView.builder(
    itemCount: 100,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(
          'row -> $index',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      );
    },
  );
}
