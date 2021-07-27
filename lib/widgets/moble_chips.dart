import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileChips extends StatefulWidget {
  final int id;
  MobileChips(this.id);
  @override
  _MobileChipsState createState() => _MobileChipsState();
}

class _MobileChipsState extends State<MobileChips> {
  int id = 0;
  double len = 50;
  Offset initialPosition = Offset(0.0, 0.0);
  Offset position = Offset(0.0, 0.0);
  Color color = Colors.red;
  List acceptedColors = [];
  List noMove = [];
  List data = [[], [], []];
  int repeticion = 0;
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

    id = widget.id;
    chips.set_id = id;
    len = chips.get_len;
    position = chips.get_positions;
    color = chips.get_colores;
    initialPosition = chips.get_initalPositions;

    final chip = Container(
      height: len,
      width: len,
      color: color,
      /*child: Text(
        id.toString(),
        textScaleFactor: 0.5,
      ),*/
    );

    final chipDragging =
        Container(height: len, width: len, color: Colors.transparent);

    return Positioned(
      top: position.dx,
      left: position.dy,
      child: Draggable(
        data: id,
        child: chip,
        feedback: chip,
        childWhenDragging: chipDragging,
        onDragCompleted: () {
          data = testData.consult;
          repeticion = testData.get_repeticion;
          setState(() {
            chips.set_id = id;
            if (data[repeticion].contains(id)) {
              objective.set_id = data[repeticion].indexOf(id);
              chips.set_position = objective.get_positions;
            }
          });
        },
        onDraggableCanceled: (velocity, Offset) {
          setState(() {
            chips.set_id = id;
            chips.set_position = chips.get_initalPositions;
          });
        },
      ),
    );
  }
}
