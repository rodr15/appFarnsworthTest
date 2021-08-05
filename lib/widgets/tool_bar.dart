import 'dart:async';
import 'dart:io';

import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/notify_avisos.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:farnsworth/screens/results.dart';
import 'package:farnsworth/widgets/moble_chips.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ToolBar extends StatefulWidget {
  @override
  _ToolBarState createState() => _ToolBarState();
}

class _ToolBarState extends State<ToolBar> {
  final FocusNode _focusNode = FocusNode();
  double minWidth = 61;
  double maxWidth = 270;
  double colorWidth = 61.0;
  bool optColorChange = false;
  double tiempoWidth = 61.0;
  bool optTiempoChange = false;
  bool backgroundChange = false;
  bool optStart = false;
  int minutes = 0;
  int seconds = 0;

  int _TimerMinutescounter = 0;
  int _TimerSecondscounter = 0;

  Timer _Testtimer = Timer.periodic(Duration(seconds: 1), (timer) {});

  int repeticiones = 4;
  List selected = [true, false, false, false];
  List subSelected = [true, false, false, false, false];
  int indexSelected = 0;
  int indexSubSelected = 0;
  int _pulsaciones = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //selected = widget.selected;
  }

  void _validation(BuildContext context) async {
    final result = await showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              content: Text('Estas seguro de devolverte?'),
              actions: <Widget>[
                OutlinedButton(
                  child: Text('Cancelar'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                OutlinedButton(
                  child: Text('Ok'),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ]);
        });
    if (result) {
      setState(() {
        _Testtimer.cancel();
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final objective = Provider.of<ObjectiveData>(context);
    final appColor = Provider.of<AppColors>(context);
    final testData = Provider.of<TestData>(context);
    final notify = Provider.of<Avisos>(context);

    minutes = testData.get_minutes;
    seconds = testData.get_seconds;

    void optcolorPressed() {
      setState(() {
        optColorChange = !optColorChange;
        optTiempoChange = false;
        (optColorChange ? colorWidth = maxWidth : colorWidth = minWidth);
        tiempoWidth = minWidth;
      });
    }

    AnimatedContainer opcionColor = AnimatedContainer(
      width: colorWidth,
      color: appColor.getBackgroundColor,
      duration: Duration(seconds: 0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              FloatingActionButton(
                heroTag: 'Btn1',
                onPressed: optcolorPressed,
                child: Icon(
                  Icons.color_lens,
                  color: appColor.getLetterColor,
                ),
                backgroundColor: (selected[0]
                    ? appColor.getBorderColor
                    : appColor.getBackgroundColor),
              ),
              Text(
                'COLORES',
                style: TextStyle(color: appColor.getLetterColor),
              )
            ],
          ),
          (optColorChange
              ? FloatingActionButton(
                  heroTag: 'Btn11',
                  mini: true,
                  onPressed: () {
                    setState(() {
                      chips.set_opcion = 0;
                    });
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                          Color.fromARGB(255, 203, 65, 84),
                          Color.fromARGB(255, 0, 80, 0)
                        ])),
                  ),
                  backgroundColor: (subSelected[1]
                      ? appColor.getBorderColor
                      : appColor.getBackgroundColor),
                  elevation: 0,
                )
              : Container()),
          (optColorChange
              ? FloatingActionButton(
                  heroTag: 'Btn12',
                  mini: true,
                  onPressed: () {
                    setState(() {
                      chips.set_opcion = 1;
                    });
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                          Color.fromARGB(255, 0, 80, 0),
                          Color.fromARGB(255, 93, 193, 185)
                        ])),
                  ),
                  backgroundColor: (subSelected[2]
                      ? appColor.getBorderColor
                      : appColor.getBackgroundColor),
                  elevation: 0,
                )
              : Container()),
          (optColorChange
              ? FloatingActionButton(
                  heroTag: 'Btn13',
                  mini: true,
                  onPressed: () {
                    setState(() {
                      chips.set_opcion = 2;
                    });
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                          Color.fromARGB(255, 93, 193, 185),
                          Color.fromARGB(255, 76, 40, 130)
                        ])),
                  ),
                  backgroundColor: (subSelected[3]
                      ? appColor.getBorderColor
                      : appColor.getBackgroundColor),
                  elevation: 0,
                )
              : Container()),
          (optColorChange
              ? FloatingActionButton(
                  heroTag: 'Btn14',
                  mini: true,
                  onPressed: () {
                    setState(() {
                      chips.set_opcion = 3;
                    });
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                          Color.fromARGB(255, 76, 40, 130),
                          Color.fromARGB(255, 203, 65, 84)
                        ])),
                  ),
                  backgroundColor: (subSelected[4]
                      ? appColor.getBorderColor
                      : appColor.getBackgroundColor),
                  elevation: 0,
                )
              : Container()),
        ],
      ),
    );

    void opttiempoPressed() {
      setState(() {
        optTiempoChange = !optTiempoChange;
        testData.setshowcronometer = optTiempoChange;
        optColorChange = false;
        (optTiempoChange ? tiempoWidth = maxWidth : tiempoWidth = minWidth);
        colorWidth = minWidth;
      });
    }

    Container opcionTiempo = Container(
      color: appColor.getBackgroundColor,
      child: Column(
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'Btn2',
            onPressed: opttiempoPressed,
            child: Icon(
              Icons.timer_outlined,
              color: appColor.getLetterColor,
            ),
            backgroundColor: (selected[1]
                ? appColor.getBorderColor
                : appColor.getBackgroundColor),
          ),
          Text(
            'TIEMPO',
            style: TextStyle(color: appColor.getLetterColor),
          ),
        ],
      ),
    );
    void optBackPressed() {
      setState(() {
        backgroundChange = !backgroundChange;
        appColor.setAppColor = backgroundChange;
      });
    }

    Column opcionBackGround = Column(children: <Widget>[
      FloatingActionButton(
        heroTag: 'Btn3',
        onPressed: optBackPressed,
        child: Icon(
          Icons.stop,
          color: appColor.getLetterColor,
        ),
        backgroundColor: (selected[2]
            ? appColor.getBorderColor
            : appColor.getBackgroundColor),
      ),
      Text(
        'FONDO',
        style: TextStyle(color: appColor.getLetterColor),
      )
    ]);

    void TestTimer() {
      _TimerMinutescounter = minutes;
      _TimerSecondscounter = seconds;
      _Testtimer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          testData.startCronometer = true;
          _TimerSecondscounter++;
          if (_TimerSecondscounter > 59) {
            _TimerSecondscounter = 0;
            _TimerMinutescounter++;
          }
          testData.set_Cronometertiempo = [
            _TimerMinutescounter,
            _TimerSecondscounter
          ];
          testData.isObjectiveFull();
          if (testData.getModify) {
            if (!testData.getObjectivesFull) {
              testData.setModify = false;
            }
            testData.setObjectivesFull = false;
          }
          if (testData.getObjectivesFull) {
            notify.set_Aviso = 'Has Terminado?';
            testData.set_Notification = true;
            if (testData.getContinue) {
              print(testData.get_repeticion);
              print(testData.consult);
              // CONTINUAR
              testData.setContinue = false;
              testData.modifyTiempoData = [
                _TimerMinutescounter,
                _TimerSecondscounter
              ];
              _Testtimer.cancel();
              testData.startCronometer = false;
              testData.disminuirRepeticion();

              if (testData.get_repeticion < 0) {
                notify.set_Aviso = 'Ha terminado el test';
                testData.set_Notification = true;
                testData.testfinished();
              } else {
                if (testData.get_repeticion > 1) {
                  notify.set_Aviso = 'OJO DERECHO';
                  notify.set_Image = 'lib/assets/derecho.png';
                  testData.set_Notification = true;
                } else {
                  notify.set_Aviso = 'OJO IZQUIERDO';
                  notify.set_Image = 'lib/assets/izquierdo.png';
                  testData.set_Notification = true;
                }
                Future.delayed(Duration(seconds: 3), () {
                  if (!testData.isactiveCronometer) {
                    TestTimer();
                    chips.shuffle();
                  }
                  testData.set_Notification = false;
                });
              }
            } else if (testData.getModify) {
              testData.set_Notification = false;
            }
          } else {
            testData.set_Notification = false;
          }
        });
      });
    }

    void startPressed() {
      setState(() {
        optStart = true;
        colorWidth = minWidth;
        tiempoWidth = minWidth;
        optColorChange = false;

        if (testData.get_repeticion == repeticiones) {
          testData.disminuirRepeticion();
          notify.set_Aviso = 'OJO DERECHO';
          notify.set_Image = 'lib/assets/derecho.png';
          testData.set_Notification = true;
          Future.delayed(Duration(seconds: 3), () {
            TestTimer();
            chips.shuffle();
            testData.set_Notification = false;
          });
        }
      });
    }

    Container start = Container(
      child: FloatingActionButton(
        heroTag: 'Btn4',
        onPressed: startPressed,
        child: Icon(
          Icons.play_arrow,
          color: appColor.getLetterColor,
        ),
        backgroundColor: (selected[3]
            ? appColor.getBorderColor
            : appColor.getBackgroundColor),
      ),
    );

    void _handleKeyEvent(RawKeyEvent event) {
      setState(() {
        _pulsaciones++;
        if (_pulsaciones == 2) {
          indexSelected = selected.indexOf(true);
          indexSubSelected = subSelected.indexOf(true);
          print(event.physicalKey.usbHidUsage);
          switch (event.physicalKey.usbHidUsage) {
            case 458834: // Arriba
              if (indexSelected != 0) {
                selected[indexSelected - 1] = true;
                selected[indexSelected] = false;
              }
              break;
            case 458833: // Abajo
              if (indexSelected != selected.length - 1) {
                selected[indexSelected + 1] = true;
                selected[indexSelected] = false;
              }
              break;
            case 458831: // Derecha
              switch (indexSelected) {
                case 0: // Colores
                  if (indexSubSelected != subSelected.length - 1) {
                    subSelected[indexSubSelected + 1] = true;
                    subSelected[indexSubSelected] = false;
                  }

                  break;
              }
              break;
            case 458832: // Izquierda
              if (indexSubSelected != 0) {
                subSelected[indexSubSelected - 1] = true;
                subSelected[indexSubSelected] = false;
              }
              break;
            case 458792: // Enter
              if (testData.get_testfinished) {
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
              } else {
                switch (indexSelected) {
                  case 0: // Colores
                    if (subSelected[0]) {
                      subSelected = [true, false, false, false, false];
                      optcolorPressed();
                    } else {
                      chips.set_opcion = indexSubSelected - 1;
                    }
                    break;
                  case 1:
                    opttiempoPressed();

                    break;
                  case 2:
                    optBackPressed();
                    break;
                  case 3:
                    startPressed();
                    break;
                }
              }
              break;
          }
          _pulsaciones = 0;
        }
      });
    }

    BackButton ReturnButton = BackButton(
      color: appColor.getLetterColor,
      onPressed: () {
        _validation(context);
      },
    );
    return RawKeyboardListener(
        autofocus: true,
        focusNode: _focusNode,
        onKey: _handleKeyEvent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ReturnButton,
            opcionColor,
            opcionTiempo,
            opcionBackGround,
            start,
          ],
        ));
  }
}
