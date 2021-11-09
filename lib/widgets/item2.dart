import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:integration_testing/bloc/controller.dart';

class Item2 extends StatefulWidget {
  ControllerBloc controller;
  Item2({Key? key, required this.controller}) : super(key: key);

  @override
  _Item2State createState() => _Item2State();
}

class _Item2State extends State<Item2> {
  String? valueDrop = 'A';

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            DropdownButton<String>(
              key: const Key('drop'),
              value: valueDrop,
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (v) {
                setState(() {
                  valueDrop = v;
                });
              },
            )
          ],
        )
      ],
    );
  }
}
