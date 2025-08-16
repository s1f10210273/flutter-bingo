import 'dart:math';

import 'package:bingo/widget/display_digit.dart';
import 'package:flutter/material.dart';

class BingoPage extends StatefulWidget {
  const BingoPage({super.key});

  @override
  State<BingoPage> createState() => _MyBingoPageState();
}

class _MyBingoPageState extends State<BingoPage> {
  int? _counter;
  final int _maxRandomNumber = 99;

  void _displayRandomNumber() {
    setState(() {
      _counter = (Random().nextInt(_maxRandomNumber + 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_counter != null) DisplayDigit(finalNumber: _counter!),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _displayRandomNumber,
        tooltip: 'random',
        child: const Icon(Icons.rocket),
      ),
    );
  }
}
