import 'package:flutter/material.dart';

class TestingBuildContext extends StatelessWidget {
  const TestingBuildContext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:  const Text('Build Context')
        ),
        body: Builder(builder: (newContext) {
          return  ElevatedButton(
            onPressed: () {
              Scaffold.of(newContext).showBottomSheet((scaffoldContext) => Container(
                width: double.infinity,
                color: Colors.green,
                padding: const EdgeInsets.all(30),
                child: const Text('Barra Inferior'),
              ));
            },
            child: const Text('Click it'),
          );
        }),
      ),
      title: 'Build Context'
    );
  }
}
