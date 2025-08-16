import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DisplayDigit extends StatefulWidget {
  final int finalNumber;

  const DisplayDigit({super.key, required this.finalNumber});

  @override
  DisplayDigitState createState() => DisplayDigitState();
}

class DisplayDigitState extends State<DisplayDigit> {
  int _currentNumber = 0;
  Timer? _timer;
  final int _displayDuration = 1500;

  @override
  void initState() {
    super.initState();
    _startRandomNumberDisplay();
  }

  @override
  void didUpdateWidget(DisplayDigit oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.finalNumber != oldWidget.finalNumber) {
      _startRandomNumberDisplay();
    }
  }

  void _startRandomNumberDisplay() {
    _timer?.cancel(); // 前のタイマーをキャンセル
    final random = Random();
    int elapsed = 0;

    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        _currentNumber = random.nextInt(100);
      });

      elapsed += 10;
      if (elapsed >= _displayDuration) {
        _timer?.cancel();
        setState(() {
          _currentNumber = widget.finalNumber;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$_currentNumber',
        style: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
      ),
    );
  }
}
