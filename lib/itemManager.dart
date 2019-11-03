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
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
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
                if (inputText.isNotEmpty) {
                  _items.add(inputText);
                  print('TextFormField value -> : ' + inputText);
                  textFormField.controller.clear();
                } else {
                  Scaffold.of(context).showSnackBar(new SnackBar(
                    content: new Text("Please enter some text in Input Bar."),
                    backgroundColor: Theme.of(context).errorColor,
                    behavior: SnackBarBehavior.floating,
                  ));
                  // ERROR : Reported Issue : https://github.com/PonnamKarthik/FlutterToast/issues/9#issuecomment-549046987
                  // Fluttertoast.showToast( 
                  //     msg: 'Please enter some text in Input Bar.',
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     gravity: ToastGravity.CENTER,
                  //     timeInSecForIos: 1,
                  //     backgroundColor: Theme.of(context).errorColor,
                  //     textColor: Theme.of(context).textSelectionColor,
                  //     fontSize: 16);
                }
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
            // child: ItemList(),
            child: Container(
          child: ListView(
            children: _items.map((element) => Item(itemName: element)).toList(),
          ),
        ))
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
