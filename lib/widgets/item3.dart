import 'package:flutter/material.dart';

class Item3 extends StatefulWidget {
  Item3({Key? key}) : super(key: key);

  @override
  _Item3State createState() => _Item3State();
}

class _Item3State extends State<Item3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [const Text('Chegou ao fim !')],
        )
      ],
    );
  }
}
