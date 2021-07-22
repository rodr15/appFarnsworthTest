import 'package:anthony/provider/aplication_colors.dart';
import 'package:anthony/provider/data_mobile_chips.dart';
import 'package:anthony/provider/data_objective_chips.dart';
import 'package:anthony/provider/notify_avisos.dart';
import 'package:anthony/provider/test_data.dart';
import 'package:anthony/screens/FifteenChips.dart';
import 'package:anthony/screens/farsworthTest.dart';
import 'package:anthony/screens/juego.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Menu/menu_15_fichas.dart';
import 'Menu/menu_principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ChipsData()),
          ChangeNotifierProvider(create: (context) => ObjectiveData()),
          ChangeNotifierProvider(create: (context) => AppColors()),
          ChangeNotifierProvider(create: (context) => TestData()),
          ChangeNotifierProvider(create: (context) => Avisos()),
        ],
        child: MaterialApp(initialRoute: 'home', routes: {
          'home': (context) =>
              MenuPrincipal(), //FifteenChips(0, false, 0, 0, Colors.black),
        }));
  }
}
