import 'package:flutter/material.dart';

class MobileChips extends StatefulWidget {
  final int id;
  final double len;
  final List chipsData;
  final List objectiveData;
  final List acceptedColors;
  final List noMove;

  MobileChips(this.id,this.len,this.chipsData,this.objectiveData,this.acceptedColors,this.noMove);

  @override
  _MobileChipsState createState() => _MobileChipsState();
}

class _MobileChipsState extends State<MobileChips> {
  int id = 0;
  double len = 50;
  Offset initialPosition = Offset(0.0,0.0);
  Offset position = Offset(0.0,0.0);
  Color color = Colors.red;
  List acceptedColors = [];
  List noMove =[];
  //List noMove = [Color(0xffcb4154) , Color(0xff104f06),Color(0xff005000) , Color(0xff56b8ab),Color(0xff5dc1b9) , Color(0xff4d3486),Color(0xff4c2882) , Color(0xffc13f58)];
  @override
  void initState() {
    super.initState();
    id = widget.id;
    len = widget.len;
    initialPosition = widget.chipsData[1][id];
    position = initialPosition;
    acceptedColors = widget.acceptedColors;
    color = widget.chipsData[0][id];
    noMove = widget.noMove;

  }

  @override
  Widget build(BuildContext context) {
    final chip = Container(
      height: len,
      width: len,
      color: color,
      /*child: Text(
        id.toString(),
        textScaleFactor: 0.5,
      ),*/
    );

    final chipDragging = Container(
        height: len,
        width: len,
        color: Colors.transparent
    );


    return Positioned(
      top:position.dx,
      left: position.dy,
      child: Draggable(
        data: color,
        child: chip,
        feedback: chip,
        childWhenDragging: chipDragging,
        onDragCompleted: () {
          if (!(noMove.contains(color))) {
            setState(() {
              if (acceptedColors.contains(color)) {
                if (widget.objectiveData[1].contains(color)) {
                  position =
                  widget.objectiveData[2][widget.objectiveData[1].indexOf(
                      color)];
                }
              }
            });
          }

        },
        onDraggableCanceled: (velocity,Offset){
          setState(() {
            position = initialPosition;
            if(widget.objectiveData[1].contains(color)){
              widget.objectiveData[0][widget.objectiveData[1].indexOf(color)] = true;
              widget.objectiveData[1][widget.objectiveData[1].indexOf(color)] = Colors.black;
            }
          });
        },
      ),
    );
  }
}
