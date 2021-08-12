import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/config_provider.dart';
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

    chips.set_id = id;
    objective.set_id = id;
    len = chips.get_len;
    position = ((notMove.contains(id) &&
            (testData.get_opcion != 4 || chips.get_numChips < 25))
        ? objective.get_positions
        : chips.get_positions);
    color = chips.get_colores;
    initialPosition = chips.get_initalPositions;
    data = testData.consult;
    repeticion = (testData.get_repeticion < 0 ? 0 : testData.get_repeticion);

    Container chip = Container(
      child: Text(
        id.toString(),
        style: TextStyle(backgroundColor: Colors.white),
      ),
      width: len,
      height: len,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular((configuration.getChipForma ? 10 : 100)),
        ),
        border: (configuration.getChipContorno
            ? Border.all(
                color: (appColor.getBackgroundColor == Colors.black
                    ? Colors.white
                    : Colors.black),
                width: 2)
            : null),
      ),
    );
    Container chipAccepted = Container(
      child: Text(
        id.toString(),
        style: TextStyle(backgroundColor: Colors.white),
      ),
      width: len,
      height: len,
      decoration: BoxDecoration(
        color: color,
        border: (configuration.getObjectiveContorno
            ? Border.all(
                color: (configuration.getObjectiveContorno
                    ? (configuration.getCajaContorno && configuration.getCaja
                        ? (appColor.getBackgroundColor == Colors.black
                            ? Colors.black
                            : Colors.white)
                        : (appColor.getBackgroundColor == Colors.black
                            ? Colors.white
                            : Colors.black))
                    : Colors.orange),
                width: 2)
            : null),
        borderRadius: BorderRadius.all(
          Radius.circular((configuration.getObjectiveForma ? 10 : 100)),
        ),
      ),
    );
    final chipDragging =
        Container(height: len, width: len, color: Colors.transparent);

    return Positioned(
      top: position.dx,
      left: position.dy,
      child: Draggable(
        data: id,
        child: (notMove.contains(id)
            ? chipAccepted
            : (data[repeticion].contains(id) ? chipAccepted : chip)),
        feedback: chip,
        childWhenDragging: chipDragging,
        onDragCompleted: () {
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
            if (data[repeticion].contains(id) && !(notMove.contains(id))) {
              testData.modifyData = [data[repeticion].indexOf(id), null];
            }
          });
        },
      ),
    );
  }
}
