import 'package:bingo/pages/bingo.dart';
import 'package:bingo/pages/stored_number_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BingoApp());
}

class BingoApp extends StatelessWidget {
  const BingoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter bingo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: BingoAppPage(),
    );
  }
}

class BingoAppPage extends StatefulWidget {
  const BingoAppPage({super.key});

  @override
  State<BingoAppPage> createState() => _BingoAppPageState();
}

class _BingoAppPageState extends State<BingoAppPage> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: labelType,
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.rocket_outlined),
                  selectedIcon: Icon(Icons.rocket),
                  label: Text('First'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.numbers_outlined),
                  selectedIcon: Icon(Icons.numbers),
                  label: Text('Second'),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: _selectedIndex == 0 ? BingoPage() : StoredNumberPage(),
            ),
          ],
        ),
      ),
    );
  }
}
