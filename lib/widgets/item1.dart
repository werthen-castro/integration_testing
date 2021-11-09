import 'package:flutter/material.dart';
import 'package:integration_testing/bloc/controller.dart';

class Item1 extends StatefulWidget {
  ControllerBloc controller;
  Item1({Key? key, required this.controller}) : super(key: key);

  @override
  _Item1State createState() => _Item1State();
}

class _Item1State extends State<Item1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const Text('Email*'),
            StreamBuilder<String>(
              stream: widget.controller.email,
              builder: (context, snapshot) {
                return Column(
                  children: <Widget>[
                    TextField(
                      key: const Key('email'),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        hoverColor: Colors.white,
                        fillColor: Colors.white,
                        errorText: snapshot.error != null
                            ? snapshot.error.toString()
                            : null,
                      ),
                      onChanged: widget.controller.changeEmail,
                    ),
                    !snapshot.hasError
                        ? const SizedBox(
                            height: 22,
                          )
                        : Container()
                  ],
                );
              },
            ),
            const SizedBox(
              height: 100,
            ),
            const Text('CPF*'),
            StreamBuilder<String>(
              stream: widget.controller.cpf,
              builder: (context, snapshot) {
                return Column(
                  children: <Widget>[
                    TextField(
                      key: const Key('cpf'),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        hoverColor: Colors.white,
                        fillColor: Colors.white,
                        errorText: snapshot.error != null
                            ? snapshot.error.toString()
                            : null,
                      ),
                      onChanged: widget.controller.changeCPF,
                    ),
                    !snapshot.hasError
                        ? const SizedBox(
                            height: 22,
                          )
                        : Container()
                  ],
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
