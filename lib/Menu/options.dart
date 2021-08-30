import 'dart:ui';
import 'package:farnsworth/provider/config_provider.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:farnsworth/screens/configuration.dart';
import 'package:farnsworth/screens/farsworthTest.dart';
import 'package:farnsworth/screens/results.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:farnsworth/provider/results_provider.dart';

class Option extends StatelessWidget {
  final List option;
  Option(this.option);

  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final objective = Provider.of<ObjectiveData>(context);
    final testData = Provider.of<TestData>(context);
    final configuration = Provider.of<ConfigProvider>(context);
    String image = option[0];
    String name = option[1];
    bool selection = option[2];
    final opcion = InkWell(
      onTap: () {
        ConfigProvider();
        switch (name) {
          case 'D15':
            testData.initTestData();
            chips.setTradicional = true;
            testData.set_tiempo = [0, 0];
            chips.clearall();
            objective.clearall();
            chips.set_numChips = 16;
            objective.set_numChips = 16;
            chips.set_screenHeigth = MediaQuery.of(context).size.height;
            chips.set_screenWidth = MediaQuery.of(context).size.width;
            objective.set_screenHeigth = MediaQuery.of(context).size.height;
            objective.set_screenWidth = MediaQuery.of(context).size.width;
            testData.initState(chips.get_numChips);
            chips.init_positions();
            objective.init_positions();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FarnsworthTest()),
            );
            break;
          case 'D15ESPECIFICO':
            testData.initTestData();
            chips.setTradicional = false;
            testData.set_tiempo = [0, 0];
            chips.clearall();
            objective.clearall();
            chips.set_numChips = 16;
            objective.set_numChips = 16;
            chips.set_screenHeigth = MediaQuery.of(context).size.height;
            chips.set_screenWidth = MediaQuery.of(context).size.width;
            objective.set_screenHeigth = MediaQuery.of(context).size.height;
            objective.set_screenWidth = MediaQuery.of(context).size.width;
            testData.initState(chips.get_numChips);
            chips.init_positions();
            objective.init_positions();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FarnsworthTest()),
            );

            break;
          case 'HUE100':
            chips.clearall();
            objective.clearall();
            testData.initTestData();

            chips.setTradicional = false;
            testData.set_tiempo = [0, 0];
            testData.set_opcion = 4;
            testData.set_repeticion = 2;
            chips.set_numChips = 93;
            objective.set_numChips = 93;
            testData.set_numChips = 93;
            chips.set_screenHeigth = MediaQuery.of(context).size.height;
            chips.set_screenWidth = MediaQuery.of(context).size.width;
            objective.set_screenHeigth = MediaQuery.of(context).size.height;
            objective.set_screenWidth = MediaQuery.of(context).size.width;
            testData.initState(chips.get_numChips);
            chips.init_hundred_positions();
            objective.init_positions();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FarnsworthTest()),
            );
            break;
          case 'CONFIGURACIÓN':
            chips.set_numChips = 16;
            chips.setTradicional = true;
            configuration.init_positions(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height, chips.get_len, 16);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ConfigurationPage()),
            );
            break;
          case 'RESULTADOS':
            ResultsProvider();
            List dataConsult = testData.consult;
            if (dataConsult[0].isEmpty) {
              testData.initTestData();
              testData.initState(chips.get_numChips); // -> Cambiar esto
            }
            testData.set_parameters_results = [
              chips.get_numChips,
              chips.get_len,
              MediaQuery.of(context).size.height,
              MediaQuery.of(context).size.width,
            ];
            testData.results_positions();

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Results()),
            );
            break;
          default:
            break;
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
            image:
                DecorationImage(fit: BoxFit.fitWidth, image: AssetImage(image)),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
            border: (selection
                ? Border.all(color: Colors.orange, width: 5)
                : Border.all(color: Colors.blueGrey.shade50, width: 5))),
      ),
    );
    final nombre = Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 1 / 10,
      width: MediaQuery.of(context).size.width / 3,
      child: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          backgroundColor: Colors.transparent,
          fontSize: MediaQuery.of(context).size.height * 0.6 / 10,
        ),
      ),
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5,
      height: MediaQuery.of(context).size.height * 1.5 / 5,
      child: Column(
        children: <Widget>[
          opcion,
          //nombre,
        ],
      ),
    );
  }
}
