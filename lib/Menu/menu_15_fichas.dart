import 'package:anthony/Menu/options.dart';
import 'package:anthony/screens/FifteenChips.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuFifteenChips extends StatefulWidget {
  const MenuFifteenChips({Key? key}) : super(key: key);

  @override
  _MenuFifteenChips createState() => _MenuFifteenChips();
}

class _MenuFifteenChips extends State<MenuFifteenChips> {
  int _pulsaciones = 0;
  int _contador = 0;
  List opciones = [
    ['hola','Rojo ',true],
    ['hola','Verde',false],
    ['hola','Azul',false],
    ['hola','Violeta',false],
  ];
  final FocusNode _focusNode = FocusNode();
  final ScrollController _controller = ScrollController();
  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }
  void _handleKeyEvent(RawKeyEvent event){
    setState(() {
      _pulsaciones++;
      if(_pulsaciones == 2) {
        for(int i = 0;i<opciones.length;i++){
          if(opciones[i][2] == true){opciones[i][2]=false;}
        }
        switch (event.physicalKey.debugName) {
          case 'Arrow Left':
            _controller.animateTo(
                _controller.offset + MediaQuery.of(context).size.width / 2,
                curve: Curves.linear, duration: Duration(milliseconds: 500));
            _contador++;
            break;
          case 'Arrow Right':
            _controller.animateTo(
                _controller.offset - MediaQuery.of(context).size.width / 2,
                curve: Curves.linear, duration: Duration(milliseconds: 500));
            _contador--;
            break;
          case 'Enter':
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FifteenChips(_contador)));
            break;
        }
        if(_contador < 0){_contador = 0;}
        if(_contador >= opciones.length){_contador = opciones.length-1;}
        opciones[_contador][2] = true;
        _pulsaciones = 0;
      }
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    GridView listaOpciones = GridView.count(
      scrollDirection: Axis.horizontal,
      controller: _controller,
      crossAxisCount: 1,
      children: List.generate(opciones.length, (index){
        return Option(opciones[index]);
      }),
    );
    return Stack(
      children: <Widget>[
      Image.asset(
        "SmartVisionPortada.jpeg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,),

      RawKeyboardListener(
          autofocus: true,
          focusNode: _focusNode,
          onKey: _handleKeyEvent,
          child: listaOpciones
      ),
          ],
    );
  }
}