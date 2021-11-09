import 'package:flutter/material.dart';

import 'screen1.dart';
import 'screen2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('teste de integração'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Teste de integração - aqui'),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                key: const Key('ir-listview'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Screen2()));
                },
                child: const Text('ListView')),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              key: const Key('ir-contator'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Screen1(
                              title: '',
                            )));
              },
              child: const Text('Contador'),
            )
          ],
        ),
      ),
    );
  }
}
