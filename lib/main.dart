import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/notify_avisos.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:farnsworth/screens/FifteenChips.dart';
import 'package:farnsworth/screens/farsworthTest.dart';
import 'package:farnsworth/screens/juego.dart';
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
<<<<<<< HEAD
    return MaterialApp(
      home: MenuPrincipal(),
    );
=======
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
>>>>>>> experiments
  }
}
