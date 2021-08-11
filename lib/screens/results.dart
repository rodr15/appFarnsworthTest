import 'package:farnsworth/Menu/menu_principal.dart';
import 'package:farnsworth/main.dart';
import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/notify_avisos.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:farnsworth/widgets/results_chip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  int repeticion = 2;

  void _validationButton(BuildContext context) async {
    final result = await showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              content:
                  Text('¿ Está seguro de volver a la pantalla principal ?'),
              actions: <Widget>[
                OutlinedButton(child: Text(' Cancelar '), onPressed: () {}),
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

    Stack resultadosD1 = Stack(
      children: List.generate(objective.get_numChips, (index) {
        return ResultsChips(index, 3);
      }),
    );
    Stack resultadosD2 = Stack(
      children: List.generate(objective.get_numChips, (index) {
        return ResultsChips(index, 2);
      }),
    );
    Stack resultadosI1 = Stack(
      children: List.generate(objective.get_numChips, (index) {
        return ResultsChips(index, 1);
      }),
    );
    Stack resultadosI2 = Stack(
      children: List.generate(objective.get_numChips, (index) {
        return ResultsChips(index, 0);
      }),
    );

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
          body: Stack(
            children: <Widget>[
              resultadosD1,
              resultadosI1,
              resultadosD2,
              resultadosI2,
            ],
          )),
    );
  }
}
