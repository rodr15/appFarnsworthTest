import 'package:farnsworth/Menu/menu_principal.dart';
import 'package:farnsworth/main.dart';
import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/notify_avisos.dart';
import 'package:farnsworth/provider/results_provider.dart';
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
    final results = Provider.of<ResultsProvider>(context);
    double s = MediaQuery.of(context).size.height;
    print(results.getNumChips);
    Stack Letreros = Stack(children: [
      Positioned(
          top: (s / 10) / 2,
          child: Row(children: [
            Text(
              'RESULTADO PRUEBA 1  - OJO DERECHO',
              style: TextStyle(color: appColor.getLetterColor),
            ),
            Text(
              ' TIEMPO => ${results.getTiempoData[0]} : ${results.getTiempoData[1]} ',
              style: TextStyle(color: appColor.getLetterColor),
            ),
          ])),
      Positioned(
        top: (13 * s / 40) + ((s / 10) - (13 * s / 40)) / 2,
        child: Row(
          children: [
            Text(
              'RESULTADO PRUEBA 2  - OJO DERECHO',
              style: TextStyle(color: appColor.getLetterColor),
            ),
            Text(
              ' TIEMPO => ${results.getTiempoData[2]} : ${results.getTiempoData[3]} ',
              style: TextStyle(color: appColor.getLetterColor),
            ),
          ],
        ),
      ),
      Positioned(
        top: (22 * s / 40) + ((13 * s / 40) - (22 * s / 40)) / 2,
        child: Row(
          children: [
            Text(
              'RESULTADO PRUEBA 1  - OJO IZQUIERDO',
              style: TextStyle(color: appColor.getLetterColor),
            ),
            Text(
              ' TIEMPO => ${results.getTiempoData[4]} : ${results.getTiempoData[5]} ',
              style: TextStyle(color: appColor.getLetterColor),
            ),
          ],
        ),
      ),
      Positioned(
        top: (31 * s / 40) + ((22 * s / 40) - (31 * s / 40)) / 2,
        child: Row(
          children: [
            Text(
              'RESULTADO PRUEBA 2  - OJO IZQUIERDO',
              style: TextStyle(color: appColor.getLetterColor),
            ),
            Text(
              ' TIEMPO => ${results.getTiempoData[6]} : ${results.getTiempoData[7]} ',
              style: TextStyle(color: appColor.getLetterColor),
            ),
          ],
        ),
      ),
    ]);

    Stack resultadosD1 = Stack(
      children: List.generate(
          (results.getNumChips > 25 ? 22 : results.getNumChips), (index) {
        return ResultsChips(index, 3);
      }),
    );
    Stack resultadosD2 = Stack(
      children: List.generate(
          (results.getNumChips > 25 ? 21 : results.getNumChips), (index) {
        return ResultsChips(index, 2);
      }),
    );
    Stack resultadosI1 = Stack(
      children: List.generate(
          (results.getNumChips > 25 ? 21 : results.getNumChips), (index) {
        return ResultsChips(index, 1);
      }),
    );
    Stack resultadosI2 = Stack(
      children: List.generate(
          (results.getNumChips > 25 ? 21 : results.getNumChips), (index) {
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
              Letreros,
              resultadosD1,
              resultadosI1,
              resultadosD2,
              resultadosI2,
            ],
          )),
    );
  }
}
