import 'dart:math';

import 'package:bingo/widget/display_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../hooks/use_stored_numbers.dart';

class BingoPage extends HookWidget {
  const BingoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useStoredNumbers();
    final counter = useState<int?>(null);
    final maxRandomNumber = 99;

    void displayRandomNumber() {
      final allNumbers = List.generate(maxRandomNumber + 1, (i) => i);
      final unusedNumbers = allNumbers
          .where((n) => !controller.contains(n))
          .toList();

      if (unusedNumbers.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('もう出せる数字がありません')));
        return;
      }

      final randomNumber =
          unusedNumbers[Random().nextInt(unusedNumbers.length)];
      controller.add(randomNumber);
      counter.value = randomNumber;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (counter.value != null)
              DisplayDigit(finalNumber: counter.value!),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: displayRandomNumber,
        tooltip: 'random',
        child: const Icon(Icons.rocket),
      ),
    );
  }
}
