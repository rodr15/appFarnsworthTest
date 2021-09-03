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
  ResultsD15(this.results);

  @override
  _ResultsD15State createState() => _ResultsD15State();
}

class _ResultsD15State extends State<ResultsD15> {
  List results = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    results = widget.results;
    print('-------');
    print(results);
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
      resultados.add(int.parse(ajustResults[0][i]));
      resultados1.add(int.parse(ajustResults[1][i]));
      if (ajustResults[2][1] != 'null') {
        print('entrando');
        resultados2.add(int.parse(ajustResults[2][i]));
        resultados3.add(int.parse(ajustResults[3][i]));
      }
    }
    print('-------  RESULTADOS');
    print(resultados2);
    Stack Numeros = Stack(
        children: List.generate(resultados.length, (index) {
      double grados = 360 / resultados.length;
      return Numeracion(index, grados * index);
    }));
    Stack Puntuacion = Stack(
        children: List.generate(resultados.length - 1, (index) {
      double grados = 360 / resultados.length;

      if (nResults == 0) {
        showResults = resultados;
      } else if (nResults == 1) {
        showResults = resultados1;
      } else if (nResults == 2) {
        showResults = resultados2;
      } else if (nResults == 3) {
        showResults = resultados3;
      }
      return Puntaje(
          grados * showResults[index], (grados * showResults[index + 1]));
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
            width: sh,
            height: sh,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(sw)),
            ),
            child: Stack(
              children: [Puntuacion, Numeros],
            )),
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
                  Text('INTENTO 1', style: TextoPuntajes),
                  FilaCuadros(resultados, 0),
                  Spacer(),
                  Text('INTENTO 2', style: TextoPuntajes),
                  FilaCuadros(resultados1, 1),
                  Spacer(),
                  if (ajustResults[2][1] != 'null')
                    Text('INTENTO 3', style: TextoPuntajes),
                  FilaCuadros(resultados2, 2),
                  Spacer(),
                  if (ajustResults[2][1] != 'null')
                    Text('INTENTO 4', style: TextoPuntajes),
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

class Numeracion extends StatelessWidget {
  int index = 0;
  double rotation = 0;
  Numeracion(this.index, this.rotation);
  List<Color> _colores = [];
  List<int> rgb = [];
  List<int> v = [];

  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    double s = MediaQuery.of(context).size.height;
    rotation = (-90 + rotation) * pi / 180;
    double h = s / 2 / 1.0555;
    int _numChips = 16;
    if (chips.getTradicional) {
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

    return Positioned(
        top: s / 2 + h * sin(rotation) - 10,
        left: s / 2 + h * cos(rotation) - 10,
        child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: _colores[index],
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Center(child: Text(index.toString())),
        ));
  }
}

class Puntaje extends StatelessWidget {
  double rotation = 0;
  double antRotation = 0;

  Puntaje(this.rotation, this.antRotation);

  double Ye = 0, Xe = 0;
  double Yae = 0, Xae = 0;
  double Dy = 0, Dx = 0;
  double h = 0, theta = 0;
  @override
  Widget build(BuildContext context) {
    final appColor = Provider.of<AppColors>(context);
    double s = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;

    rotation = (-90 + rotation) * pi / 180;
    antRotation = (-90 + antRotation) * pi / 180;

    Ye = (s / 2) + (s / 2 / 1.0555) * sin(rotation);
    Xe = (s / 2) + (s / 2 / 1.0555) * cos(rotation);
    Yae = (s / 2) + (s / 2 / 1.0555) * sin(antRotation);
    Xae = (s / 2) + (s / 2 / 1.0555) * cos(antRotation);

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
