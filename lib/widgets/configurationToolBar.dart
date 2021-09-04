import 'package:farnsworth/Menu/menu_principal.dart';

import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigurationToolBar extends StatefulWidget {
  const ConfigurationToolBar({Key? key}) : super(key: key);

  @override
  _ConfigurationToolBarState createState() => _ConfigurationToolBarState();
}

class _ConfigurationToolBarState extends State<ConfigurationToolBar> {
  final FocusNode _focusNode = FocusNode();
  bool chipForma = false;
  bool chipContorno = false;
  bool objectiveForma = false;
  bool objectiveContorno = false;
  bool caja = false;
  bool cajaForma = false;
  bool cajaContorno = false;
  int _pulsaciones = 0;
  List selected = [
    true, //0
    false, //1
    false, //2
    false, //3
    false, //4
    false, //5
    false, //6
    false, //7
    false, //8
    false, //9
    false, //10
    false, //11
    false, //12
    false,
    false,
  ];
  int indexSelected = 0;
  int indexSubSelected = 0;
  void _validation(BuildContext context) async {
    final result = await showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              content:
                  Text(' ¿ Desea guardar los cambios en la configuración ? '),
              actions: <Widget>[
                OutlinedButton(
                  child: Text('Cancelar'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                OutlinedButton(
                  child: Text('Guardar'),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ]);
        });
    if (result) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final configuration = Provider.of<ConfigProvider>(context);
    final appColor = Provider.of<AppColors>(context);
    double s = MediaQuery.of(context).size.height;
    print(s);
    chipForma = configuration.getChipForma;
    chipContorno = configuration.getChipContorno;
    objectiveForma = configuration.getObjectiveForma;
    objectiveContorno = configuration.getObjectiveContorno;
    caja = configuration.getCaja;
    cajaForma = configuration.getCajaForma;
    cajaContorno = configuration.cajaContorno;

    TextStyle Titulo = TextStyle(
        fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white);
    TextStyle SubTitulo = TextStyle(
        fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black);
    TextStyle Accion = TextStyle(
        fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white);

    Container BotonFlecha = Container(
      height: MediaQuery.of(context).size.width / 40,
      width: MediaQuery.of(context).size.width / 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 40,
            ),
          ),
          border: Border.all(color: Colors.green, width: 4)),
      child: Center(
        child: Icon(
          Icons.done,
          color: Colors.green,
          size: MediaQuery.of(context).size.width / 60,
        ),
      ),
    );
    Container BotonX = Container(
      height: MediaQuery.of(context).size.width / 40,
      width: MediaQuery.of(context).size.width / 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 40,
            ),
          ),
          border: Border.all(color: Colors.red, width: 4)),
      child: Center(
        child: Icon(
          Icons.close,
          color: Colors.red,
          size: MediaQuery.of(context).size.width / 60,
        ),
      ),
    );

    Container BotonFlechaGrey = Container(
      height: MediaQuery.of(context).size.width / 40,
      width: MediaQuery.of(context).size.width / 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 40,
            ),
          ),
          border: Border.all(color: Colors.grey, width: 4)),
      child: Center(
        child: Icon(
          Icons.done,
          color: Colors.grey,
          size: MediaQuery.of(context).size.width / 60,
        ),
      ),
    );
    Container BotonXGrey = Container(
      height: MediaQuery.of(context).size.width / 40,
      width: MediaQuery.of(context).size.width / 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 40,
            ),
          ),
          border: Border.all(color: Colors.grey, width: 4)),
      child: Center(
        child: Icon(
          Icons.close,
          color: Colors.grey,
          size: MediaQuery.of(context).size.width / 60,
        ),
      ),
    );

    Container BotonCirculo = Container(
      height: MediaQuery.of(context).size.width / 40,
      width: MediaQuery.of(context).size.width / 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 40,
            ),
          ),
          border: Border.all(color: appColor.getBorderColor, width: 4)),
    );
    Container BotonCuadrado = Container(
      height: MediaQuery.of(context).size.width / 40,
      width: MediaQuery.of(context).size.width / 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 100,
            ),
          ),
          border: Border.all(color: appColor.getBorderColor, width: 4)),
    );

    Container BotonCirculoGrey = Container(
      height: MediaQuery.of(context).size.width / 40,
      width: MediaQuery.of(context).size.width / 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 40,
            ),
          ),
          border: Border.all(color: Colors.grey, width: 4)),
    );
    Container BotonCuadradoGrey = Container(
      height: MediaQuery.of(context).size.width / 40,
      width: MediaQuery.of(context).size.width / 40,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 100,
            ),
          ),
          border: Border.all(color: Colors.grey, width: 4)),
    );

    FloatingActionButton ReturnButton = FloatingActionButton(
      heroTag: 'Btn0',
      mini: true,
      onPressed: () {
        _validation(context);
        configuration.savingConfigurations();
      },
      child: Icon(
        Icons.arrow_back,
        color: appColor.getLetterColor,
      ),
      backgroundColor:
          (selected[0] ? appColor.getBorderColor : appColor.getBackgroundColor),
    );

    void chipFormaOn() {
      setState(() {
        chipForma = true;
        configuration.setChipForma = chipForma;
      });
    }

    void chipFormaOff() {
      setState(() {
        chipForma = false;
        configuration.setChipForma = chipForma;
      });
    }

    void chipContornoOn() {
      setState(() {
        chipContorno = true;
        configuration.setChipContorno = chipContorno;
      });
    }

    void chipContornoOff() {
      setState(() {
        chipContorno = false;
        configuration.setChipContorno = chipContorno;
      });
    }

    Container Configuracion = Container(
        height: MediaQuery.of(context).size.height / 25,
        width: MediaQuery.of(context).size.width / 11,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Text(
            'SET UP',
            style: Titulo,
          ),
        ));

    Text FichaText = Text('FICHA', style: SubTitulo);
    Container FichaStack = Container(
      height: MediaQuery.of(context).size.height * 2.5 / 10,
      width: MediaQuery.of(context).size.width / 11,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'FORMA',
                style: Accion,
              ),
            )),
        if (s > 400) Spacer(),
        Container(
          height: MediaQuery.of(context).size.width / 29,
          width: MediaQuery.of(context).size.width / 12,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              if (s > 400) Spacer(),
              FloatingActionButton(
                mini: true,
                heroTag: 'Btn10',
                child: (chipForma ? BotonCuadrado : BotonCuadradoGrey),
                onPressed: chipFormaOn,
                backgroundColor: (selected[1]
                    ? appColor.getBorderColor
                    : appColor.getBackgroundColor),
              ),
              if (s > 400) Spacer(),
              FloatingActionButton(
                mini: true,
                heroTag: 'Btn01',
                child: (!chipForma ? BotonCirculo : BotonCirculoGrey),
                onPressed: chipFormaOff,
                backgroundColor: (selected[2]
                    ? appColor.getBorderColor
                    : appColor.getBackgroundColor),
              ),
              if (s > 400) Spacer(),
            ],
          ),
        ),
        if (s > 400) Spacer(),
        Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'CONTORNO',
                style: Accion,
              ),
            )),
        if (s > 400) Spacer(),
        Row(
          children: [
            if (s > 400) Spacer(),
            FloatingActionButton(
              mini: true,
              heroTag: 'Btn20',
              child: (chipContorno ? BotonFlecha : BotonFlechaGrey),
              onPressed: chipContornoOn,
              backgroundColor: (selected[3]
                  ? appColor.getBorderColor
                  : appColor.getBackgroundColor),
            ),
            if (s > 400) Spacer(),
            FloatingActionButton(
              mini: true,
              heroTag: 'Btn21',
              child: (!chipContorno ? BotonX : BotonXGrey),
              onPressed: chipContornoOff,
              backgroundColor: (selected[4]
                  ? appColor.getBorderColor
                  : appColor.getBackgroundColor),
            ),
            if (s > 400) Spacer(),
          ],
        ),
        if (s > 400) Spacer(),
      ]),
    );

    void objectiveFormaOn() {
      setState(() {
        objectiveForma = true;
        configuration.setObjectiveForma = objectiveForma;
      });
    }

    void objectiveFormaOff() {
      setState(() {
        objectiveForma = false;
        configuration.setObjectiveForma = objectiveForma;
      });
    }

    void objectiveContornoOn() {
      setState(() {
        objectiveContorno = true;
        configuration.setObjectiveContorno = objectiveContorno;
      });
    }

    void objectiveContornoOff() {
      setState(() {
        objectiveContorno = false;
        configuration.setObjectiveContorno = objectiveContorno;
      });
    }

    Text ObjetivoText = Text('OBJETIVO', style: SubTitulo);
    Container ObjetivoStack = Container(
      height: MediaQuery.of(context).size.height * 2.5 / 10,
      width: MediaQuery.of(context).size.width / 11,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'FORMA',
                style: Accion,
              ),
            )),
        if (s > 400) Spacer(),
        Container(
          height: MediaQuery.of(context).size.width / 29,
          width: MediaQuery.of(context).size.width / 12,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              if (s > 400) Spacer(),
              FloatingActionButton(
                mini: true,
                heroTag: 'Btn30',
                child: (objectiveForma ? BotonCuadrado : BotonCuadradoGrey),
                onPressed: objectiveFormaOn,
                backgroundColor: (selected[5]
                    ? appColor.getBorderColor
                    : appColor.getBackgroundColor),
              ),
              if (s > 400) Spacer(),
              FloatingActionButton(
                mini: true,
                heroTag: 'Btn31',
                child: (!objectiveForma ? BotonCirculo : BotonCirculoGrey),
                onPressed: objectiveFormaOff,
                backgroundColor: (selected[6]
                    ? appColor.getBorderColor
                    : appColor.getBackgroundColor),
              ),
              if (s > 400) Spacer(),
            ],
          ),
        ),
        if (s > 400) Spacer(),
        Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'CONTORNO',
                style: Accion,
              ),
            )),
        if (s > 400) Spacer(),
        Row(
          children: [
            if (s > 400) Spacer(),
            FloatingActionButton(
              mini: true,
              heroTag: 'Btn40',
              child: (objectiveContorno ? BotonFlecha : BotonFlechaGrey),
              onPressed: objectiveContornoOn,
              backgroundColor: (selected[7]
                  ? appColor.getBorderColor
                  : appColor.getBackgroundColor),
            ),
            if (s > 400) Spacer(),
            FloatingActionButton(
              mini: true,
              heroTag: 'Btn41',
              child: (!objectiveContorno ? BotonX : BotonXGrey),
              onPressed: objectiveContornoOff,
              backgroundColor: (selected[8]
                  ? appColor.getBorderColor
                  : appColor.getBackgroundColor),
            ),
            if (s > 400) Spacer(),
          ],
        ),
        if (s > 400) Spacer(),
      ]),
    );

    void cajaOn() {
      setState(() {
        caja = true;
        configuration.setCaja = caja;
      });
    }

    void cajaOff() {
      setState(() {
        caja = false;
        configuration.setCaja = caja;
      });
    }

    void cajaFormaOn() {
      setState(() {
        cajaForma = true;
        configuration.setCajaForma = cajaForma;
      });
    }

    void cajaFormaOff() {
      setState(() {
        cajaForma = false;
        configuration.setCajaForma = cajaForma;
      });
    }

    void cajaContornoOn() {
      setState(() {
        cajaContorno = true;
        configuration.setCajaContorno = cajaContorno;
      });
    }

    void cajaContornoOff() {
      setState(() {
        cajaContorno = false;
        configuration.setCajaContorno = cajaContorno;
      });
    }

    Text CajaText = Text('CAJA', style: SubTitulo);
    Container Caja = Container(
      child: Row(
        children: [
          if (s > 400) Spacer(),
          FloatingActionButton(
            mini: true,
            heroTag: 'Btn50',
            child: (caja ? BotonFlecha : BotonFlechaGrey),
            onPressed: cajaOn,
            backgroundColor: (selected[9]
                ? appColor.getBorderColor
                : appColor.getBackgroundColor),
          ),
          if (s > 400) Spacer(),
          FloatingActionButton(
            mini: true,
            heroTag: 'Btn51',
            child: (!caja ? BotonX : BotonXGrey),
            onPressed: cajaOff,
            backgroundColor: (selected[10]
                ? appColor.getBorderColor
                : appColor.getBackgroundColor),
          ),
          if (s > 400) Spacer(),
        ],
      ),
    );
    Container CajaStack = Container(
      height: MediaQuery.of(context).size.height * 2.5 / 10,
      width: MediaQuery.of(context).size.width / 11,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.width / 29,
            width: MediaQuery.of(context).size.width / 12,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'FORMA',
                style: Accion,
              ),
            )),
        if (s > 400) Spacer(),
        Container(
          height: MediaQuery.of(context).size.width / 29,
          width: MediaQuery.of(context).size.width / 12,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              if (s > 400) Spacer(),
              FloatingActionButton(
                mini: true,
                heroTag: 'Btn60',
                child: (cajaForma ? BotonCuadrado : BotonCuadradoGrey),
                onPressed: cajaFormaOn,
                backgroundColor: (selected[11]
                    ? appColor.getBorderColor
                    : appColor.getBackgroundColor),
              ),
              if (s > 400) Spacer(),
              FloatingActionButton(
                mini: true,
                heroTag: 'Btn61',
                child: (!cajaForma ? BotonCirculo : BotonCirculoGrey),
                onPressed: cajaFormaOff,
                backgroundColor: (selected[12]
                    ? appColor.getBorderColor
                    : appColor.getBackgroundColor),
              ),
              if (s > 400) Spacer(),
            ],
          ),
        ),
        if (s > 400) Spacer(),
        Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'FONDO',
                style: Accion,
              ),
            )),
        if (s > 400) Spacer(),
        Row(
          children: [
            if (s > 400) Spacer(),
            FloatingActionButton(
              mini: true,
              heroTag: 'Btn70',
              child: (cajaContorno ? BotonFlecha : BotonFlechaGrey),
              onPressed: cajaContornoOn,
              backgroundColor: (selected[13]
                  ? appColor.getBorderColor
                  : appColor.getBackgroundColor),
            ),
            if (s > 400) Spacer(),
            FloatingActionButton(
              mini: true,
              heroTag: 'Btn71',
              child: (!cajaContorno ? BotonX : BotonXGrey),
              onPressed: cajaContornoOff,
              backgroundColor: (selected[14]
                  ? appColor.getBorderColor
                  : appColor.getBackgroundColor),
            ),
            if (s > 400) Spacer(),
          ],
        ),
        if (s > 400) Spacer(),
      ]),
    );

    void _handleKeyEvent(RawKeyEvent event) {
      setState(() {
        _pulsaciones++;
        if (_pulsaciones == 2) {
          indexSelected = selected.indexOf(true);

          switch (event.physicalKey.usbHidUsage) {
            case 458831: // Derecha
              if (!configuration.caja && indexSelected >= 9) {
                indexSelected = 9;
              }
              if (indexSelected != selected.length - 1) {
                selected[indexSelected + 1] = true;
                selected[indexSelected] = false;
              }

              break;
            case 458832: // Izquierda
              if (indexSelected != 0) {
                selected[indexSelected - 1] = true;
                selected[indexSelected] = false;
              }
              break;
            case 458833: // Abajo
              if (!configuration.caja && indexSelected >= 8) {
                indexSelected = 8;
              }
              if (indexSelected < selected.length - 2) {
                selected[indexSelected + 2] = true;
                selected[indexSelected] = false;
              }
              break;
            case 458834: // Arriba
              if (indexSelected > 2) {
                selected[indexSelected - 2] = true;
                selected[indexSelected] = false;
              } else if (indexSelected != 0) {
                selected[0] = true;
                selected[indexSelected] = false;
              }

              break;

            case 458792: // Enter
              switch (indexSelected) {
                case 0:
                  _validation(context);
                  break;
                case 1:
                  chipForma = true;
                  configuration.setChipForma = chipForma;
                  break;
                case 2:
                  chipForma = false;
                  configuration.setChipForma = chipForma;
                  break;
                case 3:
                  chipContorno = true;
                  configuration.setChipContorno = chipContorno;
                  break;
                case 4:
                  chipContorno = false;
                  configuration.setChipContorno = chipContorno;
                  break;
                case 5:
                  objectiveForma = true;
                  configuration.setObjectiveForma = objectiveForma;
                  break;
                case 6:
                  objectiveForma = false;
                  configuration.setObjectiveForma = objectiveForma;
                  break;
                case 7:
                  objectiveContorno = true;
                  configuration.setObjectiveContorno = objectiveContorno;
                  break;
                case 8:
                  objectiveContorno = false;
                  configuration.setObjectiveContorno = objectiveContorno;
                  break;
                case 9:
                  caja = true;
                  configuration.setCaja = caja;
                  break;
                case 10:
                  caja = false;
                  configuration.setCaja = caja;
                  break;
                case 11:
                  cajaForma = true;
                  configuration.setCajaForma = cajaForma;
                  break;
                case 12:
                  cajaForma = false;
                  configuration.setCajaForma = cajaForma;
                  break;
                case 13:
                  cajaContorno = true;
                  configuration.setCajaContorno = cajaContorno;
                  break;
                case 14:
                  cajaContorno = false;
                  configuration.setCajaContorno = cajaContorno;
                  break;
                case 15:
                  break;
                default:
                  break;
              }
              break;
            default:
              break;
          }
          _pulsaciones = 0;
        }
      });
    }

    return RawKeyboardListener(
        autofocus: true,
        focusNode: _focusNode,
        onKey: _handleKeyEvent,
        child: Container(
          height: MediaQuery.of(context).size.height * 10 / 10,
          width: MediaQuery.of(context).size.width / 10,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            children: [
              ReturnButton,
              if (s > 400) Spacer(),
              Configuracion,
              if (s > 400) Spacer(),
              FichaText,
              FichaStack,
              if (s > 400) Spacer(),
              ObjetivoText,
              ObjetivoStack,
              if (s > 400)
                Spacer(
                  flex: 5,
                ),
              CajaText,
              Caja,
              (caja ? CajaStack : Container()),
              if (s > 400)
                Spacer(
                  flex: 5,
                ),
            ],
          ),
        ));
  }
}
