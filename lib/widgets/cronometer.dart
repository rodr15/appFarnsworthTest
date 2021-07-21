import 'dart:async';

import 'package:anthony/provider/aplication_colors.dart';
import 'package:anthony/provider/data_mobile_chips.dart';
import 'package:anthony/provider/data_objective_chips.dart';
import 'package:anthony/provider/test_data.dart';
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
  Timer _cronometer = Timer(Duration(seconds: 0), () {});
  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final objective = Provider.of<ObjectiveData>(context);
    final appColor = Provider.of<AppColors>(context);
    final testData = Provider.of<TestData>(context);
    seconds = testData.get_seconds;
    minutes = testData.get_minutes;
    Timer.periodic(Duration(seconds: 1), (_cronometer) {});
    return Positioned(
        right: 0,
        top: 0,
        child: Container(
          height: MediaQuery.of(context).size.height / 10,
          width: MediaQuery.of(context).size.width / 10,
          color: appColor.getBorderColor,
          child: Text((seconds == 0
              ? '${minutes}:0${seconds}'
              : '${minutes}:${seconds}')),
        ));
  }
}
