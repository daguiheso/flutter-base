import 'dart:ui';

import 'package:flutter/material.dart';

class ExampleButtons extends StatelessWidget {
  const ExampleButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Buttons",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Buttons")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                  textStyle: const TextStyle(fontSize: 20)
                ),
                onPressed: () => {debugPrint("click")},
                child: const Text("Simple Botton")
              ),
              OutlinedButton(
                style: TextButton.styleFrom(
                  primary: Colors.pink,
                  padding: const EdgeInsets.all(12)
                ),
                onPressed: () => {debugPrint("click")},
                child: const Text("Outlined Botton")
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(12)
                ),
                onPressed: () => {debugPrint("click")},
                child: const Text("Elevated Botton")
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(12)
                ),
                onPressed: null,
                child: const Text("Disabled Elevated Botton")
              )
            ],
          ),
        ));
  }
}
