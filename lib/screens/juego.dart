import 'package:anthony/provider/aplication_colors.dart';
import 'package:anthony/provider/data_mobile_chips.dart';
import 'package:anthony/provider/data_objective_chips.dart';
import 'package:anthony/widgets/objective_chips.dart';
import 'package:anthony/widgets/moble_chips.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Juego extends StatefulWidget {
  @override
  _JuegoState createState() => _JuegoState();
}

class _JuegoState extends State<Juego> {
  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final objective = Provider.of<ObjectiveData>(context);
    final appColor = Provider.of<AppColors>(context);

    Stack objetivos = Stack(
      children: List.generate(objective.get_numChips, (index) {
        return ObjectiveChips(index);
      }),
    );

    Stack mobile = Stack(
      children: List.generate(chips.get_numChips, (index) {
        return MobileChips(index);
      }),
    );

    return Scaffold(
      backgroundColor: appColor.getBackgroundColor,
      body: Stack(
        children: <Widget>[
          objetivos,
          mobile,
        ],
      ),
    );
  }
}
