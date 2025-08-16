import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DisplayDigit extends StatefulWidget {
  final int? finalNumber;

  const DisplayDigit({super.key, required this.finalNumber});

  @override
  State<DisplayDigit> createState() => _DisplayDigitState();
}

class _DisplayDigitState extends State<DisplayDigit> {
  int? _currentNumber;
  Timer? _timer;

  static const int _durationMs = 1500;
  static const int _intervalMs = 50;

  @override
  void initState() {
    super.initState();
    if (widget.finalNumber != null) {
      _startRandomNumberDisplay();
    }
  }

  @override
  void didUpdateWidget(covariant DisplayDigit oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.finalNumber != null &&
        widget.finalNumber != oldWidget.finalNumber) {
      _startRandomNumberDisplay();
    }
  }

  void _startRandomNumberDisplay() {
    _timer?.cancel();

    final random = Random();
    int elapsed = 0;

    _timer = Timer.periodic(Duration(milliseconds: _intervalMs), (timer) {
      setState(() {
        _currentNumber = random.nextInt(100);
      });

      elapsed += _intervalMs;
      if (elapsed >= _durationMs) {
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
    if (_currentNumber == null) {
      return const SizedBox.shrink();
    }

    return Center(
      child: Text(
        '$_currentNumber',
        style: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
      ),
    );
  }
}
