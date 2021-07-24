import 'dart:async';
import 'dart:math';

import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cronometer extends StatefulWidget {
  const Cronometer({Key? key}) : super(key: key);

  @override
  _CronometerState createState() => _CronometerState();
}

class _CronometerState extends State<Cronometer> {
  int seconds = 0;
  int minutes = 0;
  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final objective = Provider.of<ObjectiveData>(context);
    final appColor = Provider.of<AppColors>(context);
    final testData = Provider.of<TestData>(context);

    seconds = testData.get_Cronomterseconds;
    minutes = testData.get_Cronometerminutes;

    return Positioned(
        right: 0,
        top: 0,
        child: Container(
          height: MediaQuery.of(context).size.height / 10,
          width: MediaQuery.of(context).size.width / 10,
          color: appColor.getBackgroundColor,
          child: Center(
            child: Text(
              (seconds < 10
                  ? '${minutes}:0${seconds}'
                  : '${minutes}:${seconds}'),
              style: TextStyle(
                backgroundColor: Colors.transparent,
                color: appColor.getLetterColor,
                fontSize: MediaQuery.of(context).size.width / 30,
              ),
            ),
          ),
        ));
  }
}
