import 'package:flutter/material.dart';

class AddRemoveButtons extends StatefulWidget {
  @override
  _AddRemoveButtonsState createState() => _AddRemoveButtonsState();
}

class _AddRemoveButtonsState extends State<AddRemoveButtons> {
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _itemCount != 0
            ? IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => setState(() => _itemCount--),
              )
            : Container(),
        Text(_itemCount.toString()),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => setState(() => _itemCount++),
        )
      ],
    );
  }
}
