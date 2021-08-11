import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/config_provider.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ObjectiveChips extends StatefulWidget {
  final int id;
  ObjectiveChips(this.id);
  @override
  _ObjectiveChipsState createState() => _ObjectiveChipsState();
}

class _ObjectiveChipsState extends State<ObjectiveChips> {
  int id = 0;
  int repeticion = 0;
  double len = 50;
  Offset position = Offset(0.0, 0.0);
  List accepted = [];
  List noMove = [];
  List data = [[], [], []];
  List notMove = [0, 23, 24, 46, 47, 69, 70, 92];
  //List noMove = [Color(0xffcb4154) , Color(0xff104f06),Color(0xff005000) , Color(0xff56b8ab),Color(0xff5dc1b9) , Color(0xff4d3486),Color(0xff4c2882) , Color(0xffc13f58)];
  @override
  void initState() {
    super.initState();
    id = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final objective = Provider.of<ObjectiveData>(context);
    final appColor = Provider.of<AppColors>(context);
    final testData = Provider.of<TestData>(context);
    final configuration = Provider.of<ConfigProvider>(context);
    id = widget.id;
    objective.set_id = id;
    len = objective.get_len;
    position = objective.get_positions;
    accepted = objective.get_accepted;
    return Positioned(
      top: position.dx,
      left: position.dy,
      child: DragTarget(
        onAccept: (int c_id) {
          setState(() {
            data = testData.consult;
            repeticion = testData.get_repeticion;
            if (accepted.contains(c_id)) {
              if (data[repeticion].contains(c_id)) {
                testData.modifyData = [data[repeticion].indexOf(c_id), null];
              }
              testData.modifyData = [id, c_id];
            }
          });
        },
        builder: (BuildContext context, accepted, rejected) {
          return Container(
            width: len,
            height: len,
            decoration: BoxDecoration(
              color: accepted.isEmpty ? Colors.transparent : Colors.grey,
              border: Border.all(
                  color: (configuration.getObjectiveContorno
                      ? (configuration.getCajaContorno
                          ? (appColor.getBackgroundColor == Colors.black
                              ? Colors.black
                              : Colors.white)
                          : (appColor.getBackgroundColor == Colors.black
                              ? Colors.white
                              : Colors.black))
                      : Colors.orange),
                  width: (configuration.getObjectiveContorno ? 2 : 1)),
              borderRadius: BorderRadius.all(
                Radius.circular((configuration.getObjectiveForma ? 10 : 100)),
              ),
            ),
            //child: Text(id.toString(), style: TextStyle(color: Colors.red)),
          );
        },
      ),
    );
  }
}

          // Container(
          //   height: len,
          //   width: len,
          //   child: Text(
          //     '', //id.toString(),
          //     textScaleFactor: 1,
          //     style: TextStyle(color: appColor.getLetterColor),
          //   ),
          //   decoration: BoxDecoration(
          //       border: Border.all(color: appColor.getBorderColor),
          //       color: accepted.isEmpty ? Colors.transparent : Colors.grey),
          // );