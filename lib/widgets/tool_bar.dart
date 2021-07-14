import 'package:anthony/screens/FifteenChips.dart';
import 'package:flutter/material.dart';

class ToolBar extends StatefulWidget {
  int colorOption = 0;
  bool random = false;
  ToolBar(this.colorOption, this.random);
  @override
  _ToolBarState createState() => _ToolBarState();
}

class _ToolBarState extends State<ToolBar> {
  double toolbarWidth = 0;
  double maxWidth = 0;
  int colorOption = 0;
  bool colorChange = false;
  double colorWidth = 0;
  double colorHeight = 0;
  bool tiempoChange = false;
  double tiempoWidth = 0;
  int _TimerSecondscounter = 0;
  int _TimerMinutescounter = 0;
  bool randomChange = false;
  double randomWidth = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    randomChange = widget.random;
    colorOption = widget.colorOption;
  }

  void actionColores() {
    if (colorChange) {
      colorWidth = maxWidth;
    } else {
      colorWidth = toolbarWidth;
    }
  }

  void actionTiempo() {
    if (tiempoChange) {
      tiempoWidth = maxWidth;
    } else {
      tiempoWidth = toolbarWidth;
    }
  }

  @override
  Widget build(BuildContext context) {
    ///////////////////////
    Color rojoLadrillo = Color.fromARGB(255, 203, 65, 84);
    Color verde = Color.fromARGB(255, 0, 80, 0);
    Color azulVerdoso = Color.fromARGB(255, 93, 193, 185);
    Color violeta = Color.fromARGB(255, 76, 40, 130);
    List<dynamic> Po = [
      rojoLadrillo,
      verde,
      azulVerdoso,
      violeta
    ]; // Rojo ladrillo - Verde - Azul(verdoso) - Violeta
    List<dynamic> P = [verde, azulVerdoso, violeta, rojoLadrillo];
    /////////////////////

    colorHeight = MediaQuery.of(context).size.height * 10 / 100;
    toolbarWidth = MediaQuery.of(context).size.width * 5 / 100;
    maxWidth = 40 * 6 + toolbarWidth;

    Color toolbarColor = Colors.black;
    double toolbarPadding = 0.0;

    Color iconsColor = Colors.blue;
    /*************FUNCIONES***********/

    /*************WIDGETS***********/

    Container Fondo = Container(
      width: toolbarWidth,
      color: toolbarColor,
    );

    void push() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FifteenChips(colorOption, randomChange)),
      );
    }

    //OPCION PARA ESCOGER COLORES
    void redOption() {
      colorOption = 0;
      push();
    }

    void blueOption() {
      colorOption = 1;
      push();
    }

    void greenOption() {
      colorOption = 2;
      push();
    }

    void purpleOption() {
      colorOption = 3;
      push();
    }

    void colorPressed() {
      setState(() {
        colorChange = !colorChange;
        tiempoChange = false;
        randomChange = false;
        actionColores();
        actionTiempo();
      });
    }

    Row opcionesColores = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
          heroTag: 0,
          elevation: 0,
          backgroundColor: toolbarColor,
          hoverColor: Colors.white60,
          onPressed: redOption,
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Po[0], P[0]])),
          ),
        ),
        FloatingActionButton(
          heroTag: 1,
          elevation: 0,
          backgroundColor: toolbarColor,
          hoverColor: Colors.white60,
          onPressed: blueOption,
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Po[1], P[1]])),
          ),
        ),
        FloatingActionButton(
          heroTag: 2,
          elevation: 0,
          backgroundColor: toolbarColor,
          hoverColor: Colors.white60,
          onPressed: greenOption,
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Po[2], P[2]])),
          ),
        ),
        FloatingActionButton(
          heroTag: 3,
          elevation: 0,
          backgroundColor: toolbarColor,
          hoverColor: Colors.white60,
          onPressed: purpleOption,
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Po[3], P[3]])),
          ),
        ),
      ],
    );
    AnimatedContainer opcionColor = AnimatedContainer(
      height: colorHeight,
      width: (colorWidth > toolbarWidth ? colorWidth : toolbarWidth),
      color: toolbarColor,
      duration: Duration(milliseconds: 0),
      child: Row(
        mainAxisAlignment:
            (colorChange ? MainAxisAlignment.start : MainAxisAlignment.center),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "Bton",
            elevation: 0,
            backgroundColor: toolbarColor, // Color del circulo
            hoverColor: Colors.white60, // Color de cuando el mouse esta encima
            onPressed: colorPressed,
            child: Icon(Icons.color_lens_rounded),
          ),
          (colorChange ? opcionesColores : Row())
        ],
      ),
    );
    //OPCIÓN PARA MODIFICAR EL TIEMPO
    void tiempoPressed() {
      setState(() {
        tiempoChange = !tiempoChange;
        colorChange = false;
        randomChange = false;
        actionColores();
        actionTiempo();
      });
    }

    void masTiempo() {
      setState(() {
        _TimerSecondscounter += 30;
        if (_TimerSecondscounter >= 60) {
          _TimerMinutescounter++;
          _TimerSecondscounter = 0;
        }
      });
    }

    void menosTiempo() {
      setState(() {
        _TimerSecondscounter -= 30;
        if (_TimerSecondscounter <= 0) {
          _TimerMinutescounter--;
          _TimerSecondscounter = 0;
          if (_TimerMinutescounter <= 0) {
            _TimerMinutescounter = 0;
          }
        }
      });
    }

    Row opcionesTiempo = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: maxWidth / 10)),
        FloatingActionButton(
          heroTag: "Bton1",
          elevation: 0,
          backgroundColor: toolbarColor,
          hoverColor: Colors.white60,
          onPressed: menosTiempo,
          child: Icon(
            Icons.remove,
          ),
        ),
        Container(
          width: maxWidth / 4,
          child: Text(
            '${_TimerMinutescounter}:${_TimerSecondscounter}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: maxWidth / 10,
            ),
          ),
        ),
        FloatingActionButton(
          heroTag: "Bton2",
          elevation: 0,
          backgroundColor: toolbarColor,
          hoverColor: Colors.white60,
          onPressed: masTiempo,
          child: Icon(
            Icons.add,
          ),
        ),
      ],
    );
    AnimatedContainer opcionTiempo = AnimatedContainer(
      height: colorHeight,
      width: (tiempoWidth > toolbarWidth ? tiempoWidth : toolbarWidth),
      color: toolbarColor,
      duration: Duration(milliseconds: 0),
      child: Row(
        mainAxisAlignment:
            (tiempoChange ? MainAxisAlignment.start : MainAxisAlignment.center),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "Bton3",
            elevation: 0,
            backgroundColor: toolbarColor, // Color del circulo
            hoverColor: Colors.white60, // Color de cuando el mouse esta encima
            onPressed: tiempoPressed,
            child: Icon(Icons.timer),
          ),
          (tiempoChange ? opcionesTiempo : Row())
        ],
      ),
    );

    // OPCIÓN PARA RANDOM
    void randomPressed() {
      setState(() {
        randomChange = !randomChange;
        colorChange = false;
        tiempoChange = false;
        actionColores();
        actionTiempo();
        push();
      });
    }

    Container opcionRandom = Container(
      width: toolbarWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "Bton6",
            elevation: 0,
            backgroundColor: toolbarColor, // Color del circulo
            hoverColor: Colors.white60, // Color de cuando el mouse esta encima
            onPressed: randomPressed,
            child: Icon(Icons.change_circle),
          ),
        ],
      ),
    );

    Column Opciones =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      opcionColor,
      Container(
        margin: EdgeInsets.symmetric(horizontal: toolbarWidth / 10),
        width: toolbarWidth - 2 * toolbarWidth / 10,
        child: Text('COLOR',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: toolbarWidth / 4,
            )),
      ),
      opcionTiempo,
      Container(
        width: toolbarWidth,
        child: Text('${_TimerMinutescounter}:${_TimerSecondscounter}',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: toolbarWidth / 4,
            )),
      ),
      opcionRandom,
      Container(
        width: toolbarWidth,
        child: Text(randomChange ? ('Desordenado') : ('Ordenado'),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: toolbarWidth / 6,
            )),
      )
    ]);

    BoxConstraints buttonBox = BoxConstraints(
      minWidth: 0.0,
      maxWidth: toolbarWidth / 5,
      minHeight: 0.0,
      maxHeight: toolbarWidth / 5,
    );

    return Stack(
      children: <Widget>[
        Fondo,
        Opciones,
      ],
    );
  }
}
