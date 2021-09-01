import 'dart:math';
import 'dart:core';
import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultsHUE100 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final appColor = Provider.of<AppColors>(context);
    double s = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    int maxError = 0;
    List unique = [];
    TextStyle TextoPuntajes = TextStyle(
      color: appColor.getBorderColor,
      fontSize: s / 10,
      shadows: <BoxShadow>[
        BoxShadow(
          color: appColor.getLetterColor,
          blurRadius: 10.0,
          offset: Offset(0.0, 0.0),
        ),
      ],
    );
    // List<int> puntaje = [];

    int findMin(List<int> numbers) {
      return numbers.reduce(min);
    }

    int findMax(List<int> numbers) {
      return numbers.reduce(max);
    }

    List<int> resultados = List.generate(85, (index) {
      return index;
    });
    // List resultados = [
    //   0,
    //   1,
    //   2,
    //   3,
    //   4,
    //   5,
    //   6,
    //   8,
    //   7,
    //   9,
    //   10,
    //   11,
    //   12,
    //   13,
    //   14,
    //   15,
    //   16,
    //   17,
    //   18,
    //   19,
    //   20,
    //   21,
    //   22,
    //   23,
    //   24,
    //   25,
    //   26,
    //   27,
    //   28,
    //   29,
    //   30,
    //   32,
    //   31,
    //   33,
    //   34,
    //   35,
    //   36,
    //   37,
    //   38,
    //   40,
    //   39,
    //   41,
    //   42,
    //   43,
    //   44,
    //   45,
    //   46,
    //   47,
    //   48,
    //   49,
    //   50,
    //   51,
    //   52,
    //   53,
    //   54,
    //   55,
    //   56,
    //   57,
    //   58,
    //   59,
    //   60,
    //   61,
    //   62,
    //   63,
    //   64,
    //   65,
    //   66,
    //   67,
    //   68,
    //   69,
    //   70,
    //   71,
    //   72,
    //   73,
    //   74,
    //   75,
    //   76,
    //   77,
    //   78,
    //   79,
    //   80,
    //   82,
    //   81,
    //   83,
    //   84
    // ];

    List<int> puntaje = List.generate(85, (index) {
      return index;
    });
    resultadosCalculo() {
      for (int i = 0; i < resultados.length; i++) {
        if (resultados[i] != 0 && resultados[i] != resultados.length - 1) {
          puntaje[resultados[i]] = ((resultados[i] - resultados[i - 1]).abs() +
              (resultados[i + 1] - resultados[i]).abs());
        } else {
          puntaje[resultados[i]] = 2;
        }
      }

      unique.add(puntaje[0]);
      for (int i = 0; i < puntaje.length; i++) {
        if (!unique.contains(puntaje[i])) {
          unique.add(puntaje[i]);
        }
      }

      maxError = findMax(puntaje);
    }

    resultadosCalculo();
    Stack Lineas = Stack(
        children: List.generate(resultados.length, (index) {
      double grados = 360 / resultados.length;
      //   children: List.generate(chips.get_numChips, (index) {
      // double grados = 360 / chips.get_numChips;
      return Lines(index, grados * index);
    }));
    Stack Numeros = Stack(
        children: List.generate(resultados.length, (index) {
      double grados = 360 / resultados.length;
      //   children: List.generate(chips.get_numChips, (index) {
      // double grados = 360 / chips.get_numChips;
      return Numeracion(index, grados * index);
    }));
    Stack Puntuacion = Stack(
        children: List.generate(resultados.length, (index) {
      double grados = 360 / resultados.length;
      //   children: List.generate(chips.get_numChips, (index) {
      // double grados = 360 / chips.get_numChips;
      return Puntaje(
          index,
          grados * index,
          (maxError < 6 ? 5 : maxError),
          puntaje[index],
          puntaje[(index > 0 ? index - 1 : 0)],
          grados * (index > 0 ? index - 1 : 0));
    }));
    Stack Referencias = Stack(
      children: List.generate((maxError < 6 ? 5 : maxError), (index) {
        return Circulos(index, (maxError < 6 ? 5 : maxError));
      }),
    );

    return Row(children: [
      Container(
        height: s,
        width: s,
        decoration: BoxDecoration(
          color: appColor.getLetterColor,
          borderRadius: BorderRadius.all(
              Radius.circular(MediaQuery.of(context).size.width)),
        ),
        child: Stack(children: [
          Lineas,
          Numeros,
          Referencias,
          Puntuacion,
          CirculosFijos((maxError < 6 ? 5 : maxError)),
        ]),
      ),
      Container(
          width: sw - s,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'DALTONISMO       LEVE',
                style: TextoPuntajes,
              ),
              Text(
                'MARCADOR       ' +
                    (puntaje.reduce((value, element) => value + element) - 170)
                        .toString(),
                style: TextoPuntajes,
              ),
            ],
          )),
    ]);
  }
}

class CirculosFijos extends StatelessWidget {
  int maxError = 0;
  CirculosFijos(this.maxError);
  @override
  Widget build(BuildContext context) {
    final appColor = Provider.of<AppColors>(context);
    double s = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          // 0.9
          top: s / 2 - s / 2.2222,
          left: s / 2 - s / 2.2222,
          child: Container(
            width: s / 1.1111,
            height: s / 1.1111,
            decoration: BoxDecoration(
              border: Border.all(color: appColor.getBackgroundColor),
              borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.width)),
            ),
            alignment: Alignment.topCenter,
            child: Text(maxError.toString()),
          ),
        ),
        Positioned(
          // CENTRO
          top: s / 2 - 25,
          left: s / 2 - 25,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: appColor.getLetterColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.width)),
            ),
          ),
        ),
      ],
    );
  }
}

class Circulos extends StatelessWidget {
  int maxError = 0;
  int index = 0;
  Circulos(this.index, this.maxError);
  @override
  Widget build(BuildContext context) {
    final appColor = Provider.of<AppColors>(context);
    double s = MediaQuery.of(context).size.height;
    return Stack(children: [
      Positioned(
        top: s / 2 - index * (s / 1.1111) / (2 * maxError),
        left: s / 2 - index * (s / 1.1111) / (2 * maxError),
        child: Container(
          width: index * (s / 1.1111) / (maxError),
          height: index * (s / 1.1111) / (maxError),
          decoration: BoxDecoration(
            border: Border.all(color: appColor.getBackgroundColor),
            borderRadius: BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width)),
          ),
          alignment: Alignment.topCenter,
          child: Text(index.toString()),
        ),
      ),
    ]);
  }
}

class Numeracion extends StatelessWidget {
  int index = 0;
  double rotation = 0;
  Numeracion(this.index, this.rotation);
  List<Color> _colores = [];
  List<int> rgb = [];
  List<int> v = [];
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
  @override
  Widget build(BuildContext context) {
    double s = MediaQuery.of(context).size.height;
    rotation = (-90 + rotation) * pi / 180;
    double h = s / 2 / 1.0555;
    for (int opcion = 0; opcion < 4; opcion++) {
      v.clear();
      for (int i = 0; i <= 2; i++) {
        v.add(P[opcion][i] - Po[opcion][i]);
      }
      int num = 0;
      if (opcion == 0) {
        num = 24;
      } else {
        num = 23;
      }
      for (int i = 0; i < num; i++) {
        for (int j = 0; j <= 2; j++) {
          rgb.add((Po[opcion][j] + v[j] * (i / (num + 1))).round());
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

class Lines extends StatelessWidget {
  int index = 0;
  double rotation = 0;
  Lines(this.index, this.rotation);

  @override
  Widget build(BuildContext context) {
    final appColor = Provider.of<AppColors>(context);
    double s = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;

    rotation = (-90 + rotation) * pi / 180;
    return Positioned(
      top: s / 2,
      left: s / 2,
      child: Container(
        transform: Matrix4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0,
            1.0, 0.0, 0.0, 0.0, 0.0, 1.0)
          ..rotateZ(rotation),

        // width: s / 2,
        width: s / 2 / 1.1111,
        height: 0.5,
        color: appColor.getBackgroundColor,
      ),
    );
  }
}

class Puntaje extends StatelessWidget {
  int index = 0;
  int maxError = 0;
  int puntaje = 0;
  int antPuntaje = 0;
  double rotation = 0;
  double antRotation = 0;

  Puntaje(this.index, this.rotation, this.maxError, this.puntaje,
      this.antPuntaje, this.antRotation);
  double error = 0;
  double antError = 0;

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

    if (maxError == 2) {
      maxError = 4;
    }

    error = (puntaje * s / 2.2222) / (maxError);
    antError = (antPuntaje * s / 2.2222) / (maxError);
    Ye = (s / 2) + error * sin(rotation);
    Xe = (s / 2) + error * cos(rotation);
    Yae = (s / 2) + antError * sin(antRotation);
    Xae = (s / 2) + antError * cos(antRotation);

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
