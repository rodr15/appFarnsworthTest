import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/config_provider.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/notify_avisos.dart';
import 'package:farnsworth/provider/results_provider.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:farnsworth/screens/configuration.dart';
import 'package:farnsworth/screens/splash_Scren.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:farnsworth/Preferences/user_preferences.dart';

import 'Menu/menu_principal.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
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
          ChangeNotifierProvider(create: (context) => ConfigProvider()),
          ChangeNotifierProvider(create: (context) => ResultsProvider()),
        ],
        child: MaterialApp(initialRoute: 'home', routes: {
          'splash': (context) => SplashScreen(),
          'home': (context) => MenuPrincipal(),
          'configuration': (context) => ConfigurationPage(),
          //FifteenChips(0, false, 0, 0, Colors.black),
        }));
  }
}
