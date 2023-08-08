import 'dart:math';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Flipper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Number Flipper'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _duration = const Duration(milliseconds: 1000);
  final tecMin = TextEditingController(text: "1");
  final tecMax = TextEditingController(text: "2000");

  @override
  void dispose() {
    tecMin.dispose();
    tecMin.dispose();
    super.dispose();
  }

  void _genRandomNumber() {
    setState(() {
      final min = int.tryParse(tecMin.text) ?? 0;
      final max = int.tryParse(tecMax.text) ?? 9999;

      _duration = const Duration(milliseconds: 1000);
      _counter = min + Random().nextInt(max - min);
    });
  }

  void _reset() {
    setState(() {
      _duration = const Duration(milliseconds: 0);
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
                child: AnimatedFlipCounter(
              duration: _duration,
              curve: Curves.easeIn,
              value: _counter,
              wholeDigits: 4,
              textStyle: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: tecMin,
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Minimum",
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                ),
                Container(width: 8),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: tecMax,
                    keyboardType: const TextInputType.numberWithOptions(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Maximum",
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                ),
                Container(width: 8),
                ElevatedButton(
                  onPressed: () => _genRandomNumber(),
                  child: const Text("Generate Random 4 Digit"),
                ),
                Container(width: 8),
                ElevatedButton(
                  onPressed: () => _reset(),
                  child: const Text("Reset"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
