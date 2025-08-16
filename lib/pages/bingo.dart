import 'package:bingo/widget/display_digit.dart';
import 'package:flutter/material.dart';

class BingoPage extends StatefulWidget {
  const BingoPage({super.key, required this.title});
  final String title;

  @override
  State<BingoPage> createState() => _MyBingoPageState();
}

class _MyBingoPageState extends State<BingoPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_counter', style: Theme.of(context).textTheme.displayLarge),
            DisplayDigit(finalNumber: _counter),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
