import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/notify_avisos.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultsChips extends StatefulWidget {
  final int id;
  final int repeticion;
  ResultsChips(this.id, this.repeticion);

  @override
  _ResultsChipsState createState() => _ResultsChipsState();
}

class _ResultsChipsState extends State<ResultsChips> {
  int id = 0;
  int repeticion = 0;
  Offset position = Offset(0, 0);
  List data = [[], [], []];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.id;
    repeticion = widget.repeticion;
  }

  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final objective = Provider.of<ObjectiveData>(context);
    final appColor = Provider.of<AppColors>(context);
    final testData = Provider.of<TestData>(context);
    final notify = Provider.of<Avisos>(context);

    testData.set_id = id;
    testData.set_repeticion = repeticion;
    position = testData.get_results_positions;
    data = testData.consult;

    return Positioned(
      top: position.dx,
      left: position.dy,
      child: Container(
        width: objective.get_len,
        height: objective.get_len,
        decoration: BoxDecoration(
          border: Border.all(color: appColor.getBorderColor),
        ),
        child: Column(
          children: <Widget>[
            Center(
                child: Text(
              id.toString(),
              style: TextStyle(
                color: appColor.getLetterColor,
                backgroundColor: Colors.transparent,
              ),
            )),
            Spacer(),
            Center(
                child: Text(
              data[repeticion][id].toString(),
              style: TextStyle(
                color: appColor.getLetterColor,
                backgroundColor: Colors.transparent,
                fontSize: 20,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
