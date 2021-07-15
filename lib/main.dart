import 'package:anthony/screens/FifteenChips.dart';
import 'package:flutter/material.dart';

import 'Menu/menu_15_fichas.dart';
import 'Menu/menu_principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(body: FifteenChips(0, false, 0, 0, Colors.black)));
  }
}
