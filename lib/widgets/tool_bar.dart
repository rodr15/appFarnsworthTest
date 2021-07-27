import 'dart:async';
import 'dart:io';

import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/notify_avisos.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:farnsworth/widgets/moble_chips.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToolBar extends StatefulWidget {
  @override
  _ToolBarState createState() => _ToolBarState();
}

class _ToolBarState extends State<ToolBar> {
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
                backgroundColor: appColor.getBackgroundColor,
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
                  backgroundColor: appColor.getBackgroundColor,
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
                  backgroundColor: appColor.getBackgroundColor,
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
                  backgroundColor: appColor.getBackgroundColor,
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
                  backgroundColor: appColor.getBackgroundColor,
                  elevation: 0,
                )
              : Container()),
        ],
      ),
    );

    void opttiempoPressed() {
      setState(() {
        optTiempoChange = !optTiempoChange;
        optColorChange = false;
        (optTiempoChange ? tiempoWidth = maxWidth : tiempoWidth = minWidth);
        colorWidth = minWidth;
      });
    }

    void masTiempo() {
      setState(() {
        seconds += 2; // AUMENTO
        if (seconds >= 60) {
          minutes++;
          seconds = 0;
        }
        testData.set_tiempo = [minutes, seconds];
      });
    }

    void menosTiempo() {
      setState(() {
        seconds -= 30;
        if (seconds < 0) {
          minutes--;
          seconds = 30;
        }
        if (minutes < 0) {
          minutes = 0;
          seconds = 0;
        }
        testData.set_tiempo = [minutes, seconds];
      });
    }

    AnimatedContainer opcionTiempo = AnimatedContainer(
      color: appColor.getBackgroundColor,
      width: tiempoWidth,
      duration: Duration(seconds: 0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              FloatingActionButton(
                heroTag: 'Btn2',
                onPressed: opttiempoPressed,
                child: Icon(
                  Icons.lock_clock,
                  color: appColor.getLetterColor,
                ),
                backgroundColor: appColor.getBackgroundColor,
              ),
              Text(
                'TIEMPO',
                style: TextStyle(color: appColor.getLetterColor),
              ),
            ],
          ),
          (optTiempoChange
              ? FloatingActionButton(
                  heroTag: 'Btn21',
                  elevation: 0,
                  mini: true,
                  onPressed: menosTiempo,
                  child: Icon(
                    Icons.remove,
                    color: appColor.getLetterColor,
                  ),
                  backgroundColor: appColor.getBackgroundColor,
                )
              : Container()),
          (optTiempoChange
              ? Container(
                  width: 80,
                  child: Text(
                    (seconds < 10 ? '$minutes:0$seconds' : '$minutes:$seconds'),
                    style: TextStyle(
                      color: appColor.getLetterColor,
                    ),
                  ),
                )
              : Container()),
          (optTiempoChange
              ? FloatingActionButton(
                  heroTag: 'Btn22',
                  elevation: 0,
                  mini: true,
                  onPressed: masTiempo,
                  child: Icon(
                    Icons.add,
                    color: appColor.getLetterColor,
                  ),
                  backgroundColor: appColor.getBackgroundColor,
                )
              : Container()),
        ],
      ),
    );

    Column opcionBackGround = Column(children: <Widget>[
      FloatingActionButton(
        heroTag: 'Btn3',
        onPressed: () {
          setState(() {
            backgroundChange = !backgroundChange;
            appColor.setAppColor = backgroundChange;
          });
        },
        child: Icon(
          Icons.stop,
          color: appColor.getLetterColor,
        ),
        backgroundColor: appColor.getBackgroundColor,
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
          _TimerSecondscounter--;
          if (_TimerSecondscounter < 0) {
            if (_TimerMinutescounter != 0) {
              _TimerSecondscounter = 59;
            } else {
              _TimerSecondscounter = 0;
            }
            _TimerMinutescounter--;
          }
          if (_TimerMinutescounter < 0) {
            _Testtimer.cancel();
            testData.startCronometer = false;
            optStart = false;
            _TimerMinutescounter = 0;
            if (testData.get_repeticion == 0) {
              notify.set_Aviso = 'TEST FINALIZADO';
              notify.set_Image = 'lib/assets/warning.png';
              testData.set_Notification = true;
              testData.testfinished();
            }
          }
          testData.set_Cronometertiempo = [
            _TimerMinutescounter,
            _TimerSecondscounter
          ];
        });
      });
    }

    void startPressed() {
      setState(() {
        colorWidth = minWidth;
        tiempoWidth = minWidth;
        optColorChange = false;
        optTiempoChange = false;
        if (!testData.get_testfinished) {
          if (minutes == 0 && seconds == 0) {
            notify.set_Aviso = 'No hay tiempo';
            notify.set_Image = 'lib/assets/warning.png';
            testData.set_Notification = true;
          } else {
            if (!optStart) {
              optStart = true;
              testData.disminuirRepeticion();
              if (testData.get_repeticion <= repeticiones) {
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
                  testData.startCronometer = true;
                });
              }
            }
          }
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
        backgroundColor: appColor.getBackgroundColor,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        opcionColor,
        opcionTiempo,
        opcionBackGround,
        start,
      ],
    );
  }
}
