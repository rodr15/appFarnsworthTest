import 'dart:async';

import 'package:farnsworth/Menu/options.dart';
import 'package:farnsworth/provider/config_provider.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/results_provider.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:farnsworth/screens/configuration.dart';
import 'package:farnsworth/screens/farsworthTest.dart';
import 'package:farnsworth/screens/results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({Key? key}) : super(key: key);

  @override
  _MenuPrincipal createState() => _MenuPrincipal();
}

class _MenuPrincipal extends State<MenuPrincipal> {
  int _pulsaciones = 0;
  int _contador = 0;
  List opciones = [
    ['lib/assets/D15.jpg', 'D15', true],
    ['lib/assets/D15E.jpg', 'D15ESPECIFICO', false],
    ['lib/assets/HUE100.jpg', 'HUE100', false],
    ['lib/assets/CONFIG.jpg', 'CONFIGURACIÓN', false],
    ['lib/assets/RESULTS.jpg', 'RESULTADOS', false],
  ];
  String teclado = '';
  final FocusNode _focusNode = FocusNode();
  final ScrollController _controller = ScrollController();
  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    _contador = 0;

    opciones = [
      ['lib/assets/D15.jpg', 'D15', true],
      ['lib/assets/D15E.jpg', 'D15ESPECIFICO', false],
      ['lib/assets/HUE100.jpg', 'HUE100', false],
      ['lib/assets/CONFIG.jpg', 'CONFIGURACIÓN', false],
      ['lib/assets/RESULTS.jpg', 'RESULTADOS', false],
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final objective = Provider.of<ObjectiveData>(context);
    final testData = Provider.of<TestData>(context);
    final configuration = Provider.of<ConfigProvider>(context);
    final results = Provider.of<ResultsProvider>(context);

    void _handleKeyEvent(RawKeyEvent event) {
      setState(() {
        _pulsaciones++;
        if (_pulsaciones == 2) {
          switch (event.physicalKey.usbHidUsage) {
            case 458831: // Derecha
              _controller.animateTo(
                  _controller.offset + MediaQuery.of(context).size.width / 4,
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 100));
              _contador++;
              break;
            case 458832: // Izquierda
              _controller.animateTo(
                  _controller.offset - MediaQuery.of(context).size.width / 4,
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 100));
              _contador--;
              break;
            case 458792: //Enter
              ConfigProvider();
              switch (_contador) {
                case 0: // Tradicional
                  testData.initTestData();
                  chips.setTradicional = true;
                  testData.set_tiempo = [0, 0];
                  chips.clearall();
                  objective.clearall();
                  chips.set_numChips = 16;
                  objective.set_numChips = 16;
                  chips.set_screenHeigth = MediaQuery.of(context).size.height;
                  chips.set_screenWidth = MediaQuery.of(context).size.width;
                  objective.set_screenHeigth =
                      MediaQuery.of(context).size.height;
                  objective.set_screenWidth = MediaQuery.of(context).size.width;
                  testData.initState(chips.get_numChips);
                  chips.init_positions();
                  objective.init_positions();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FarnsworthTest()),
                  );
                  break;
                case 1:
                  testData.initTestData();
                  chips.setTradicional = false;
                  testData.set_tiempo = [0, 0];
                  chips.clearall();
                  objective.clearall();
                  chips.set_numChips = 16;
                  objective.set_numChips = 16;
                  chips.set_screenHeigth = MediaQuery.of(context).size.height;
                  chips.set_screenWidth = MediaQuery.of(context).size.width;
                  objective.set_screenHeigth =
                      MediaQuery.of(context).size.height;
                  objective.set_screenWidth = MediaQuery.of(context).size.width;
                  testData.initState(chips.get_numChips);
                  chips.init_positions();
                  objective.init_positions();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FarnsworthTest()),
                  );

                  break;
                case 2:
                  testData.initTestData();
                  chips.setTradicional = false;
                  testData.set_tiempo = [0, 0];
                  testData.set_opcion = 4;
                  chips.clearall();
                  objective.clearall();
                  chips.set_numChips = 93;
                  objective.set_numChips = 93;
                  testData.set_numChips = 93;
                  chips.set_screenHeigth = MediaQuery.of(context).size.height;
                  chips.set_screenWidth = MediaQuery.of(context).size.width;
                  objective.set_screenHeigth =
                      MediaQuery.of(context).size.height;
                  objective.set_screenWidth = MediaQuery.of(context).size.width;
                  testData.initState(chips.get_numChips);
                  chips.init_hundred_positions();
                  objective.init_positions();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FarnsworthTest()),
                  );

                  break;
                case 3: // conf
                  chips.set_numChips = 16;
                  chips.setTradicional = true;
                  configuration.init_positions(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height,
                      chips.get_len,
                      16);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConfigurationPage()),
                  );
                  break;
                case 4: // RESULTADOS
                
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
              }
              break;
            case 458773:
              
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
          }
          if (_contador < 0) {
            _contador = 0;
          }
          if (_contador >= opciones.length) {
            _contador = opciones.length - 1;
          }
          for (int i = 0; i < opciones.length; i++) {
            if (opciones[i][2]) {
              opciones[i][2] = false;
            }
          }
          opciones[_contador][2] = true;
          _pulsaciones = 0;
        }
      });
    }

    GridView listaOpciones = GridView.count(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 18 / 30,
        left: MediaQuery.of(context).size.width * 4 / 10,
        right: MediaQuery.of(context).size.width * 4 / 10,
      ),
      shrinkWrap: true,
      // primary: true,

      childAspectRatio: 1.1,
      mainAxisSpacing: 100,
      scrollDirection: Axis.horizontal,
      controller: _controller,
      crossAxisCount: 1,
      children: List.generate(opciones.length, (index) {
        return Option(opciones[index]);
      }),
    );
    return Scaffold(
        body: Stack(
      children: <Widget>[
        /*Container(
            child: Positioned(
          top: 0,
          left: 0,
          child: Text(
            teclado,
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        )),*/
        Image.asset(
          "lib/assets/FONDO.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        RawKeyboardListener(
          autofocus: true,
          focusNode: _focusNode,
          onKey: _handleKeyEvent,
          child: listaOpciones,
        ),
        // Container(
        //     child: Text(
        //   '${opciones[_contador][1].toString()}',
        //   style: TextStyle(fontSize: 100, backgroundColor: Colors.white),
        // ))
      ],
    ));
  }
}
