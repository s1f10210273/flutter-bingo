// lib/hooks/use_stored_numbers.dart

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _storageKey = 'stored_numbers';

class StoredNumbersController {
  final List<int> numbers;
  final Future<void> Function(int) add;
  final Future<void> Function() clear;
  final bool Function(int) contains;

  StoredNumbersController({
    required this.numbers,
    required this.add,
    required this.clear,
    required this.contains,
  });
}

StoredNumbersController useStoredNumbers() {
  final numbers = useState<List<int>>([]);

  useEffect(() {
    _loadNumbers().then((value) => numbers.value = value);
    return null;
  }, []);

  Future<void> add(int number) async {
    final prefs = await SharedPreferences.getInstance();
    final current = [...numbers.value];

    if (!current.contains(number)) {
      current.add(number);
      await prefs.setStringList(
        _storageKey,
        current.map((e) => e.toString()).toList(),
      );
      numbers.value = current;
    }
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
    numbers.value = [];
  }

  bool contains(int number) {
    return numbers.value.contains(number);
  }

  return StoredNumbersController(
    numbers: numbers.value,
    add: add,
    clear: clear,
    contains: contains,
  );
}

Future<List<int>> _loadNumbers() async {
  final prefs = await SharedPreferences.getInstance();
  final list = prefs.getStringList(_storageKey) ?? [];
  return list.map(int.parse).toList();
}
