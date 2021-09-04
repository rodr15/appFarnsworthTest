import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/notify_avisos.dart';
import 'package:farnsworth/provider/results_provider.dart';
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
  Color color = Colors.transparent;
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
    final results = Provider.of<ResultsProvider>(context);
    id = widget.id;
    repeticion = widget.repeticion;
    testData.set_id = id;
    testData.set_repeticion = repeticion;
    position = testData.get_results_positions;
    data = results.getResults;

    id = (results.getNumChips < 25
        ? id
        : (repeticion == 3
            ? id
            : repeticion == 2
                ? id + 22
                : repeticion == 1
                    ? id + 43
                    : id + 64));
    int data_id = id + (chips.get_numChips * repeticion);
    return Positioned(
      top: position.dx,
      left: position.dy,
      child: Container(
        width: objective.get_len,
        height: objective.get_len + 15,
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
            Center(
                child: ((id == 0 && results.getNumChips > 25 ? 85 : id)
                            .toString() ==
                        (chips.get_numChips > 25
                            ? data[id].toString()
                            : data[data_id].toString())
                    ? Icon(Icons.done, color: Colors.green)
                    : Icon(
                        Icons.close,
                        color: Colors.red,
                      ))),
            Center(
                child: Text(
              (results.getNumChips > 25
                  ? data[id].toString()
                  : data[data_id].toString()),
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
