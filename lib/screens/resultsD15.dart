import 'dart:math';

import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/notify_avisos.dart';
import 'package:farnsworth/provider/results_provider.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:farnsworth/widgets/results_chip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultsD15 extends StatefulWidget {
  List results = [];
  List time = [];
  bool tradicional = false;
  ResultsD15(this.results, this.time, this.tradicional);

  @override
  _ResultsD15State createState() => _ResultsD15State();
}

class _ResultsD15State extends State<ResultsD15> {
  List results = [];
  List time = [];
  bool tradicional = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    results = widget.results;
    time = widget.time;
    tradicional = widget.tradicional;
  }

  int nResults = 0;
  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final objective = Provider.of<ObjectiveData>(context);
    final appColor = Provider.of<AppColors>(context);
    final testData = Provider.of<TestData>(context);
    final notify = Provider.of<Avisos>(context);

    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    List ajustResults = [[], [], [], []];
    List<int> showResults = [];
    List<int> resultados = [];
    List<int> resultados1 = [];
    List<int> resultados2 = [];
    List<int> resultados3 = [];
    for (int i = 0; i < results.length; i++) {
      int a = 0;
      if (i < 16) {
        a = 0;
      } else if (i < 32) {
        a = 1;
      } else if (i < 48) {
        a = 2;
      } else {
        a = 3;
      }
      ajustResults[a].add(results[i]);
    }
    print('-------');
    print(ajustResults.length);
    for (int i = 0; i < ajustResults[0].length; i++) {
      if (ajustResults[2][1] != 'null') {
        resultados3.add(int.parse(ajustResults[0][i]));
        resultados2.add(int.parse(ajustResults[1][i]));

        resultados1.add(int.parse(ajustResults[2][i]));
        resultados.add(int.parse(ajustResults[3][i]));
      } else {
        resultados.add(int.parse(ajustResults[0][i]));
        resultados.add(int.parse(ajustResults[1][i]));
      }
    }

    Stack Numeros = Stack(
        children: List.generate(resultados.length, (index) {
      return Numeracion(index, tradicional);
    }));
    Stack Puntuacion = Stack(
        children: List.generate(resultados.length - 1, (index) {
      if (nResults == 0) {
        showResults = resultados;
      } else if (nResults == 1) {
        showResults = resultados1;
      } else if (nResults == 2) {
        showResults = resultados2;
      } else if (nResults == 3) {
        showResults = resultados3;
      }
      return Puntaje(showResults[index], showResults[index + 1]);
    }));
    TextStyle TextoPuntajes = TextStyle(
        color: Colors.white, fontSize: sh / 20, fontWeight: FontWeight.bold);
    Row Botones = Row(children: [
      Spacer(),
      Text(
        'GRAFICAR',
        style: TextoPuntajes,
      ),
      Spacer(),
      FloatingActionButton(
        heroTag: 'Btn0',
        child: Text(
          '1',
          style: TextoPuntajes,
        ),
        onPressed: () {
          setState(() {
            nResults = 0;
          });
        },
        backgroundColor:
            (nResults == 0 ? appColor.getBorderColor : Colors.black),
      ),
      FloatingActionButton(
        heroTag: 'Btn1',
        child: Text(
          '2',
          style: TextoPuntajes,
        ),
        onPressed: () {
          setState(() {
            nResults = 1;
          });
        },
        backgroundColor:
            (nResults == 1 ? appColor.getBorderColor : Colors.black),
      ),
      if (ajustResults[2][1] != 'null')
        FloatingActionButton(
          heroTag: 'Btn2',
          child: Text(
            '3',
            style: TextoPuntajes,
          ),
          onPressed: () {
            setState(() {
              nResults = 2;
            });
          },
          backgroundColor:
              (nResults == 2 ? appColor.getBorderColor : Colors.black),
        ),
      if (ajustResults[2][1] != 'null')
        FloatingActionButton(
          heroTag: 'Btn3',
          child: Text(
            '4',
            style: TextoPuntajes,
          ),
          onPressed: () {
            setState(() {
              nResults = 3;
            });
          },
          backgroundColor:
              (nResults == 3 ? appColor.getBorderColor : Colors.black),
        ),
      Spacer(),
    ]);
    return Row(
      children: [
        Container(
            width: sh - sh / 15,
            height: sh - sh / 15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(sw)),
            ),
            child: Stack(
              children: [
                if (tradicional) LineasTradicional(),
                Puntuacion,
                Numeros,
              ],
            )),
        Spacer(),
        Container(
          width: sw - sh,
          height: sh,

          // alignment: Alignment.center,
          child: Stack(
            children: [
              Column(
                children: [
                  Spacer(),
                  Botones,
                  Spacer(),
                  Text('INTENTO 1   Tiempo: ${time[0]} : ${time[1]}',
                      style: TextoPuntajes),
                  FilaCuadros(resultados, 0),
                  Spacer(),
                  Text('INTENTO 2   Tiempo: ${time[2]} : ${time[3]}',
                      style: TextoPuntajes),
                  FilaCuadros(resultados1, 1),
                  Spacer(),
                  if (ajustResults[2][1] != 'null')
                    Text('INTENTO 3   Tiempo: ${time[4]} : ${time[5]}',
                        style: TextoPuntajes),
                  FilaCuadros(resultados2, 2),
                  Spacer(),
                  if (ajustResults[2][1] != 'null')
                    Text('INTENTO 4   Tiempo: ${time[6]} : ${time[7]}',
                        style: TextoPuntajes),
                  FilaCuadros(resultados3, 3),
                  Spacer(),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class LineasTradicional extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double s = MediaQuery.of(context).size.height;
    double h = 2 * 311.2269066792989;
    double tritan = 15 * -pi / 180;

    double deutan = 80 * -pi / 180;
    double protan = 95 * -pi / 180;
    double xTritan = 219;
    double yTritan = 93;
    double hTritan =
        (sqrt(pow(xTritan, 2) + pow(yTritan, 2)) * (s / 2 / 1.0555)) /
            sqrt(pow(298, 2) + pow(139, 2));
    double rotationTritan = -(203) * pi / 180;

    double xDeutan = 119;
    double yDeutan = 192;
    double hDeutan =
        (sqrt(pow(xDeutan, 2) + pow(yDeutan, 2)) * (s / 2 / 1.0555)) /
            sqrt(pow(298, 2) + pow(139, 2));
    double rotationDeutan = -(238) * pi / 180;
    double xProtan = 71;
    double yProtan = 215;
    double hProtan =
        (sqrt(pow(xProtan, 2) + pow(yProtan, 2)) * (s / 2 / 1.0555)) /
            sqrt(pow(298, 2) + pow(139, 2));
    double rotationProtan = -(251) * pi / 180;

    return Stack(
      children: [
        Positioned(
          top: s / 2 + hTritan * sin(rotationTritan),
          left: s / 2 + hTritan * cos(rotationTritan),
          child: Container(
              transform: Matrix4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0,
                  0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0)
                ..rotateZ(tritan),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: s,
                    height: 2,
                    color: Colors.blue,
                  ),
                ],
              )),
        ),
        Positioned(
          top: s / 2 + hTritan * sin(rotationTritan) + 2,
          left: s / 2 + hTritan * cos(rotationTritan),
          child: Container(
              transform: Matrix4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0,
                  0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0)
                ..rotateZ(tritan + pi),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: s,
                    height: 2,
                    color: Colors.blue,
                  ),
                ],
              )),
        ),
        Positioned(
          top: s / 2 + hDeutan * sin(rotationDeutan),
          left: s / 2 + hDeutan * cos(rotationDeutan),
          child: Container(
              transform: Matrix4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0,
                  0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0)
                ..rotateZ(deutan),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: s,
                    height: 2,
                    color: Colors.green,
                  ),
                ],
              )),
        ),
        Positioned(
          top: s / 2 + hDeutan * sin(rotationDeutan) - 2,
          left: s / 2 + hDeutan * cos(rotationDeutan) + 2,
          child: Container(
              transform: Matrix4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0,
                  0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0)
                ..rotateZ(deutan + pi),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: s,
                    height: 2,
                    color: Colors.green,
                  ),
                ],
              )),
        ),
        Positioned(
          top: s / 2 + hProtan * sin(rotationProtan),
          left: s / 2 + hProtan * cos(rotationProtan),
          child: Container(
              transform: Matrix4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0,
                  0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0)
                ..rotateZ(protan),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: s,
                    height: 2,
                    color: Colors.red,
                  ),
                ],
              )),
        ),
        Positioned(
          top: s / 2 + hProtan * sin(rotationProtan) - 2,
          left: s / 2 + hProtan * cos(rotationProtan) + 2,
          child: Container(
              transform: Matrix4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0,
                  0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0)
                ..rotateZ(protan + pi),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: s,
                    height: 2,
                    color: Colors.red,
                  ),
                ],
              )),
        ),
      ],
    );
  }
}

class Numeracion extends StatelessWidget {
  int index = 0;
  bool tradicional = false;
  Numeracion(this.index, this.tradicional);
  List<Color> _colores = [];
  List<int> rgb = [];
  List<int> v = [];
  double rotation = 0;
  List x = [
    298,
    226,
    144,
    81,
    5,
    69,
    148,
    207,
    223,
    187,
    123,
    60,
    10,
    97,
    164,
    219
  ];
  List y = [
    139,
    164,
    193,
    215,
    226,
    215,
    170,
    91,
    36,
    140,
    201,
    236,
    226,
    196,
    160,
    93
  ];
  List rotaciones = [
    155,
    144,
    127,
    110,
    91,
    72,
    49,
    24,
    351,
    323,
    301,
    284,
    267,
    244,
    224,
    203
  ];
  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    double s = MediaQuery.of(context).size.height;
    rotation = -(rotaciones[index]) * pi / 180;

    double h = (sqrt(pow(x[index], 2) + pow(y[index], 2)) * (s / 2 / 1.0555)) /
        sqrt(pow(x[0], 2) + pow(y[0], 2));
    int _numChips = 16;
    if (tradicional) {
      _colores = [
        Color.fromARGB(255, 54, 130, 191),
        Color.fromARGB(255, 51, 132, 179),
        Color.fromARGB(255, 56, 135, 167),
        Color.fromARGB(255, 61, 133, 154),
        Color.fromARGB(255, 54, 137, 143),
        Color.fromARGB(255, 60, 137, 128),
        Color.fromARGB(255, 89, 132, 117),
        Color.fromARGB(255, 107, 131, 97),
        Color.fromARGB(255, 129, 124, 97),
        Color.fromARGB(255, 145, 120, 96),
        Color.fromARGB(255, 156, 110, 109),
        Color.fromARGB(255, 160, 109, 124),
        Color.fromARGB(255, 156, 110, 137),
        Color.fromARGB(255, 146, 114, 153),
        Color.fromARGB(255, 142, 114, 164),
        Color.fromARGB(255, 127, 117, 176),
      ];
    } else {
      //List c = [Colors.blue,Colors.cyan,Colors.green,Colors.brown,Colors.red,Colors.purple,Colors.];
      int _opcion = chips.get_opcion;
      List<dynamic> Po = [
        [178, 118, 111], // ROJO
        [151, 145, 75],
        [78, 150, 135],
        [132, 132, 163],
      ]; // Rojo ladrillo - Verde - Azul(verdoso) - Violeta
      List<dynamic> P = [
        [157, 142, 72],
        [82, 150, 135],
        [123, 132, 163],
        [179, 118, 115],
      ]; // Verde-Azul(verdoso)-Violeta-Rojoladrillo
      List<int> v = [];
      List<int> rgb = [];

      for (int i = 0; i <= 2; i++) {
        v.add(P[_opcion][i] - Po[_opcion][i]);
      }
      for (int i = 0; i < _numChips + 1; i++) {
        for (int j = 0; j <= 2; j++) {
          rgb.add((Po[_opcion][j] + v[j] * (i / (_numChips + 1))).round());
        }
        _colores.add(Color.fromARGB(255, rgb[0], rgb[1], rgb[2]));
        rgb.clear();
      }
    }
    print('------- $index -------------------');
    print(s / 2 + h * sin(rotation) - 20);
    print(s / 2 + h * cos(rotation) - 20);
    return Positioned(
        top: s / 2 + h * sin(rotation) - 20,
        left: s / 2 + h * cos(rotation) - 20,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: _colores[index],
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Center(child: Text(index.toString())),
        ));
  }
}

class Puntaje extends StatelessWidget {
  int index = 0;
  int indexAnt = 0;

  Puntaje(this.index, this.indexAnt);
  List x = [
    298,
    226,
    144,
    81,
    5,
    69,
    148,
    207,
    223,
    187,
    123,
    60,
    10,
    97,
    164,
    219
  ];
  List y = [
    139,
    164,
    193,
    215,
    226,
    215,
    170,
    91,
    36,
    140,
    201,
    236,
    226,
    196,
    160,
    93
  ];
  List rotaciones = [
    155,
    144,
    127,
    110,
    91,
    72,
    49,
    24,
    351,
    323,
    301,
    284,
    267,
    244,
    224,
    203
  ];
  double Ye = 0, Xe = 0;
  double Yae = 0, Xae = 0;
  double Dy = 0, Dx = 0;
  double h = 0, theta = 0;
  List d = [];

  @override
  Widget build(BuildContext context) {
    final appColor = Provider.of<AppColors>(context);
    double s = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;

    for (int i = 0; i < x.length; i++) {
      d.add((sqrt(pow(x[i], 2) + pow(y[i], 2)) * (s / 2 / 1.0555)) /
          (sqrt(pow(x[0], 2) + pow(y[0], 2))));
      rotaciones[i] = -rotaciones[i] * pi / 180;
      print('$index');
      print('${rotaciones[index]}');
    }
    Ye = (s / 2) + d[index] * sin(rotaciones[index]);
    Xe = (s / 2) + d[index] * cos(rotaciones[index]);
    Yae = (s / 2) + d[indexAnt] * sin(rotaciones[indexAnt]);
    Xae = (s / 2) + d[indexAnt] * cos(rotaciones[indexAnt]);

    Dy = Ye - Yae;
    Dx = Xe - Xae;
    theta = atan2(Dy, Dx);
    h = sqrt(pow(Dx, 2) + pow(Dy, 2));
    return Positioned(
      top: Yae,
      left: Xae,
      child: Container(
          transform: Matrix4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0,
              1.0, 0.0, 0.0, 0.0, 0.0, 1.0)
            ..rotateZ(theta),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: h,
                height: 2,
                color: appColor.getBorderColor,
              ),
            ],
          )),
    );
  }
}

class Cuadros extends StatelessWidget {
  bool selected = false;
  int numChips = 16;
  int index = 0;
  int result = 0;
  Cuadros(this.index, this.result, this.selected);
  @override
  Widget build(BuildContext context) {
    final appColor = Provider.of<AppColors>(context);
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;

    return Container(
      width: (sw - sh) / numChips,
      height: sh / 10,
      decoration: BoxDecoration(
        border: Border.all(color: appColor.getBorderColor),
      ),
      child: Column(
        children: [
          Text(
            index.toString(),
            style: TextStyle(color: Colors.white),
          ),
          (index == result
              ? Icon(Icons.done, color: Colors.green)
              : Icon(
                  Icons.close,
                  color: Colors.red,
                )),
          Text(
            result.toString(),
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class FilaCuadros extends StatelessWidget {
  List resultados = [];
  int nFila = 0;
  FilaCuadros(this.resultados, this.nFila);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(resultados.length, (index) {
      return Cuadros(index, resultados[index], false);
    }));
  }
}
