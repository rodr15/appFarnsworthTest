import 'package:farnsworth/Menu/options.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/notify_avisos.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:farnsworth/screens/FifteenChips.dart';
import 'package:farnsworth/screens/farsworthTest.dart';
import 'package:farnsworth/screens/hundred_chips.dart';
import 'package:farnsworth/widgets/warning.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'menu_15_fichas.dart';

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({Key? key}) : super(key: key);

  @override
  _MenuPrincipal createState() => _MenuPrincipal();
}

class _MenuPrincipal extends State<MenuPrincipal> {
  int _pulsaciones = 0;
  int _contador = 0;
  List opciones = [
    ['hola', '15 Fichas', true],
    ['hola', '100 Fichas', false],
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
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final objective = Provider.of<ObjectiveData>(context);
    final testData = Provider.of<TestData>(context);

    void _handleKeyEvent(RawKeyEvent event) {
      setState(() {
        print(event.physicalKey.toStringShort());
        _pulsaciones++;
        if (_pulsaciones == 2) {
          teclado = event.physicalKey.debugName.toString();
          for (int i = 0; i < opciones.length; i++) {
            if (opciones[i][2] == true) {
              opciones[i][2] = false;
            }
          }
          switch (event.physicalKey.debugName) {
            case 'Arrow Left':
              _controller.animateTo(
                  _controller.offset + MediaQuery.of(context).size.width / 2,
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 500));
              _contador++;
              break;
            case 'Arrow Right':
              _controller.animateTo(
                  _controller.offset - MediaQuery.of(context).size.width / 2,
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 500));
              _contador--;
              break;
            case 'Enter':
              switch (_contador) {
                case 0:
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
                  objective.set_screenHeigth =
                      MediaQuery.of(context).size.height;
                  objective.set_screenWidth = MediaQuery.of(context).size.width;
                  testData.initState(chips.get_numChips);
                  chips.init_positions();

                  break;
                case 1:
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
                  objective.set_screenHeigth =
                      MediaQuery.of(context).size.height;
                  objective.set_screenWidth = MediaQuery.of(context).size.width;
                  testData.initState(chips.get_numChips);
                  chips.init_positions();

                  break;
              }
              break;
          }
          if (_contador < 0) {
            _contador = 0;
          }
          if (_contador >= opciones.length) {
            _contador = opciones.length - 1;
          }
          opciones[_contador][2] = true;
          _pulsaciones = 0;
        }
      });
    }

    GridView listaOpciones = GridView.count(
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
        Container(
            child: Positioned(
          top: 0,
          left: 0,
          child: Text(
            teclado,
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
        )),
        /*Image.asset(
          "lib/assets/SmartVisionPortada.jpeg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),*/
        RawKeyboardListener(
            autofocus: true,
            focusNode: _focusNode,
            onKey: _handleKeyEvent,
            child: listaOpciones),
      ],
    ));
  }
}
