import 'dart:math';

import 'package:farnsworth/Menu/menu_principal.dart';
import 'package:farnsworth/main.dart';
import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/notify_avisos.dart';
import 'package:farnsworth/provider/results_provider.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:farnsworth/screens/resultsD15.dart';
import 'package:farnsworth/screens/resultsHUE100.dart';
import 'package:farnsworth/widgets/results_chip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  void _validationButton(BuildContext context) async {
    final result = await showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              content:
                  Text('¿ Está seguro de volver a la pantalla principal ?'),
              actions: <Widget>[
                OutlinedButton(
                  child: Text(' Cancelar '),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                OutlinedButton(
                    child: Text(' Ir '),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "home", (route) => false);
                    }),
              ]);
        });
  }

  void _validation(BuildContext context) async {
    final result = false;
  }

  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final objective = Provider.of<ObjectiveData>(context);
    final appColor = Provider.of<AppColors>(context);
    final testData = Provider.of<TestData>(context);
    final notify = Provider.of<Avisos>(context);
    final results = Provider.of<ResultsProvider>(context);
    double s = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;

    return WillPopScope(
        onWillPop: () {
          _validation(context);
          return Future.value(false);
        },
        child: Scaffold(
            floatingActionButton: BackButton(
                color: appColor.getLetterColor,
                onPressed: () {
                  _validationButton(context);
                }),
            backgroundColor: appColor.getBackgroundColor,
            // body: (results.getNumChips > 25 ? ResultsHUE100() : ResultsD15())
            body: Container(
              width: sw,
              height: s,
              child: (results.getNumChips < 25
                  ? ResultsD15(results.getResults)
                  : ResultsHUE100(results.getResults)),
            )));
  }
}
