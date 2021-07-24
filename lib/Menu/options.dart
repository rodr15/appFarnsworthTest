import 'dart:ui';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:farnsworth/screens/farsworthTest.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Option extends StatelessWidget {
  final List option;
  Option(this.option);

  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final objective = Provider.of<ObjectiveData>(context);
    final testData = Provider.of<TestData>(context);
    String image = option[0];
    String name = option[1];
    bool selection = option[2];
    final opcion = InkWell(
      onTap: () {
        switch (name) {
          case '15 Fichas':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FarnsworthTest()),
            );
            testData.set_tiempo = [0, 0];
            chips.clearall();
            objective.clearall();
            chips.set_numChips = 15;
            objective.set_numChips = 15;
            chips.set_screenHeigth = MediaQuery.of(context).size.height;
            chips.set_screenWidth = MediaQuery.of(context).size.width;
            objective.set_screenHeigth = MediaQuery.of(context).size.height;
            objective.set_screenWidth = MediaQuery.of(context).size.width;
            testData.initState(chips.get_numChips);
            chips.init_positions();

            break;
          case '100 Fichas':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FarnsworthTest()),
            );
            testData.set_tiempo = [0, 0];
            chips.clearall();
            objective.clearall();
            chips.set_numChips = 100;
            objective.set_numChips = 100;
            chips.set_screenHeigth = MediaQuery.of(context).size.height;
            chips.set_screenWidth = MediaQuery.of(context).size.width;
            objective.set_screenHeigth = MediaQuery.of(context).size.height;
            objective.set_screenWidth = MediaQuery.of(context).size.width;
            testData.initState(chips.get_numChips);
            chips.init_positions();

            break;
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
            color: Colors.blue,
            /*image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image)
        ),*/
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
            border: (selection
                ? Border.all(color: Colors.orange, width: 10)
                : null)),
      ),
    );
    final nombre = Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 1.5 / 10,
      width: MediaQuery.of(context).size.width / 3,
      child: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          backgroundColor: Colors.transparent,
          fontSize: MediaQuery.of(context).size.height / 10,
        ),
      ),
    );
    return Padding(
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).size.height * 15 / 30),
      child: Column(
        children: <Widget>[
          opcion,
          nombre,
        ],
      ),
    );
  }
}
