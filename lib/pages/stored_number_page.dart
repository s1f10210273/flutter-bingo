import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../hooks/use_stored_numbers.dart';

class StoredNumberPage extends HookWidget {
  const StoredNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useStoredNumbers();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            controller.numbers.isEmpty
                ? const Text('数字は保存されていません')
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: controller.numbers
                          .map(
                            (n) => Text(
                              '${n.toString()}, ',
                              style: const TextStyle(
                                fontSize: 48,
                                fontFeatures: [
                                  FontFeature.tabularFigures(),
                                ], // ← 等幅数字
                                fontFamily: 'monospace',
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.clear,
        tooltip: '全削除',
        child: const Icon(Icons.delete),
      ),
    );
  }
}
