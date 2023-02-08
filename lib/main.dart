// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:contador/counter_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Count',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Count(),
    );
  }
}

class Count extends StatelessWidget {
  Count({super.key});

  Counter count = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador Com MobX"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text("O numero de vezes que você clicou é:"),
            Observer(
              builder: (_) => Text(
                '${count.value}',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    count.increment();
                  },
                  child: Icon(Icons.add),
                ),
                const SizedBox(
                  height: 35,
                ),
                InkWell(
                  onTap: () {
                    count.clear();
                  },
                  child: Icon(Icons.clear),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
