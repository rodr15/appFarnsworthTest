import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:farnsworth/widgets/caja.dart';
import 'package:farnsworth/widgets/objective_chips.dart';
import 'package:farnsworth/widgets/moble_chips.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Juego extends StatefulWidget {
  @override
  _JuegoState createState() => _JuegoState();
}

class _JuegoState extends State<Juego> {
  bool habilitado = false;
  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final objective = Provider.of<ObjectiveData>(context);
    final appColor = Provider.of<AppColors>(context);
    final testData = Provider.of<TestData>(context);
    Stack objetivos = Stack(
      children: List.generate(objective.get_numChips, (index) {
        if (chips.get_numChips > 25) {
          switch (testData.get_opcion) {
            case 4:
              habilitado = true;
              break;
            case 3:
              if (index < 24) {
                habilitado = true;
              } else {
                habilitado = false;
              }
              break;
            case 2:
              if (index >= 24 && index < 47) {
                habilitado = true;
              } else {
                habilitado = false;
              }
              break;
            case 1:
              if (index >= 47 && index < 70) {
                habilitado = true;
              } else {
                habilitado = false;
              }
              break;
            case 0:
              if (index >= 70) {
                habilitado = true;
              } else {
                habilitado = false;
              }
              break;
          }
        } else {
          habilitado = true;
        }
        return (habilitado ? ObjectiveChips(index) : Container());
      }),
    );

    Stack mobile = Stack(
      children: List.generate(chips.get_numChips, (index) {
        if (chips.get_numChips > 25) {
          switch (testData.get_opcion) {
            case 4:
              habilitado = true;
              break;
            case 3:
              if (index < 24) {
                habilitado = true;
              } else {
                habilitado = false;
              }
              break;
            case 2:
              if (index >= 24 && index < 47) {
                habilitado = true;
              } else {
                habilitado = false;
              }
              break;
            case 1:
              if (index >= 47 && index < 70) {
                habilitado = true;
              } else {
                habilitado = false;
              }
              break;
            case 0:
              if (index >= 70) {
                habilitado = true;
              } else {
                habilitado = false;
              }
              break;
          }
        } else {
          habilitado = true;
        }
        return (habilitado ? MobileChips(index) : Container());
      }),
    );

    return Scaffold(
      backgroundColor: appColor.getBackgroundColor,
      body: Stack(
        children: <Widget>[
          if (testData.get_opcion != 4 || chips.get_numChips < 25)
            Caja(appColor.getBackgroundColor == Colors.black ? true : false),
          objetivos,
          mobile,
        ],
      ),
    );
  }
}
