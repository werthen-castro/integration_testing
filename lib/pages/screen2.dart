import 'package:flutter/material.dart';
import 'package:integration_testing/bloc/controller.dart';
import 'package:integration_testing/widgets/item1.dart';
import 'package:integration_testing/widgets/item2.dart';
import 'package:integration_testing/widgets/item3.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  ControllerBloc controllerBloc = ControllerBloc();
  final PageController controllerPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
                physics: const BouncingScrollPhysics(),
                controller: controllerPage,
                children: <Widget>[
                  Item1(controller: controllerBloc),
                  Item2(controller: controllerBloc),
                  Item3(),
                ],
                onPageChanged: (num) {
                  print("Número da página atual : " + num.toString());
                },
              ),
            ),
            StreamBuilder<bool>(
                stream: controllerBloc.validForm,
                initialData: false,
                builder: (context, snapshot) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          key: const Key('anterior'),
                          onPressed:
                              snapshot.data != null && snapshot.data == true
                                  ? () {
                                      controllerPage.previousPage(
                                          duration:
                                              const Duration(milliseconds: 100),
                                          curve: Curves.bounceOut);
                                    }
                                  : null,
                          child: const Text('Anterior')),
                      ElevatedButton(
                          key: const Key('proximo'),
                          onPressed:
                              snapshot.data != null && snapshot.data == true
                                  ? () {
                                      controllerPage.nextPage(
                                          duration:
                                              const Duration(milliseconds: 100),
                                          curve: Curves.bounceOut);
                                    }
                                  : null,
                          child: const Text('Proxímo'))
                    ],
                  );
                })
          ],
        ));
  }
}
