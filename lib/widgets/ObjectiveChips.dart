import 'package:flutter/material.dart';

class ObjectiveChips extends StatefulWidget {
  final int id;
  final double len;
  final List chipsData;
  final List objectiveData;
  final List acceptedColors;
  final List noMove;
  ObjectiveChips(this.id, this.len, this.chipsData, this.objectiveData,
      this.acceptedColors, this.noMove);

  @override
  _ObjectiveChipsState createState() => _ObjectiveChipsState();
}

class _ObjectiveChipsState extends State<ObjectiveChips> {
  int id = 0;
  double len = 50;
  Offset position = Offset(0.0, 0.0);
  Color objectiveColor = Colors.red;
  List acceptedColors = [];
  List noMove = [];
  //List noMove = [Color(0xffcb4154) , Color(0xff104f06),Color(0xff005000) , Color(0xff56b8ab),Color(0xff5dc1b9) , Color(0xff4d3486),Color(0xff4c2882) , Color(0xffc13f58)];
  @override
  void initState() {
    super.initState();
    id = widget.id;
    len = widget.len;
    position = widget.objectiveData[2][id];
    acceptedColors = widget.acceptedColors;
    noMove = widget.noMove;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position.dx,
      left: position.dy,
      child: DragTarget(
        onAccept: (Color color) {
          if (!(noMove.contains(color))) {
            setState(() {
              if (acceptedColors.contains(color)) {
                // Verificar si esta disponible
                if (widget.objectiveData[0][widget.id] == true) {
                  if (widget.objectiveData[1].contains(color)) {
                    widget.objectiveData[0]
                        [widget.objectiveData[1].indexOf(color)] = true;
                    widget.objectiveData[1]
                        [widget.objectiveData[1].indexOf(color)] = Colors.black;
                  }
                  objectiveColor = color; // Tomar el color
                  widget.objectiveData[0][widget.id] =
                      false; // Decir que esta ocupado
                  widget.objectiveData[1][widget.id] =
                      color; // Guardar el color que tiene
                  //print(widget.objectiveData[1]);
                }
              }
            });
          }
        },
        builder: (BuildContext context, accepted, rejected) {
          return Container(
            height: len,
            width: len,
            /*child: Text(
              id.toString(),
              textScaleFactor: 0.5,
            ),*/
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                color: accepted.isEmpty ? Colors.transparent : Colors.grey),
          );
        },
      ),
    );
  }
}
