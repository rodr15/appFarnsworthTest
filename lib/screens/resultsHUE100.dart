import 'dart:math';
import 'dart:core';
import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultsHUE100 extends StatelessWidget {
  List results = [];
  ResultsHUE100(this.results);
  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final appColor = Provider.of<AppColors>(context);
    double s = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    List<int> resultados = [];
    int maxError = 0;
    List unique = [];
    int puntajeFinal = 0;
    TextStyle TextoPuntajes = TextStyle(
      color: appColor.getBorderColor,
      fontSize: s / 12,
      // shadows: <BoxShadow>[
      //   BoxShadow(
      //     color: colors.white,
      //     blurRadius: 10.0,
      //     offset: Offset(0.0, 0.0),
      //   ),
      // ],
    );

    for (int i = 0; i < results.length; i++) {
      resultados.add(int.parse(results[i]));
    }

    int findMin(List<int> numbers) {
      return numbers.reduce(min);
    }

    int findMax(List<int> numbers) {
      return numbers.reduce(max);
    }

    List<int> puntaje = List.generate(resultados.length, (index) {
      return index;
    });
    resultadosCalculo() {
      if (resultados.contains(85)) {
        resultados[resultados.indexOf(85)] = 0;
      }

      for (int i = 0; i < resultados.length; i++) {
        if (i != 0 && i != resultados.length - 1) {
          puntaje[resultados[i]] = ((resultados[i] - resultados[i - 1]).abs() +
              (resultados[i + 1] - resultados[i]).abs());
        } else if (i == 0) {
          puntaje[resultados[i]] = ((resultados.length +
                      resultados[i] -
                      resultados[resultados.length - 1])
                  .abs() +
              (resultados[i + 1] - resultados[i]).abs());
        } else if (i == resultados.length - 1) {
          puntaje[resultados[i]] = ((resultados[i] - resultados[i - 1]).abs() +
              (resultados.length + resultados[0] - resultados[i]).abs());
        }
      }

      unique.add(puntaje[0]);
      for (int i = 0; i < puntaje.length; i++) {
        if (!unique.contains(puntaje[i])) {
          unique.add(puntaje[i]);
        }
      }

      maxError = findMax(puntaje);
      puntajeFinal =
          (puntaje.reduce((value, element) => value + element) - 170);
    }

    resultadosCalculo();
    Stack Lineas = Stack(
        children: List.generate(resultados.length, (index) {
      double grados = 360 / resultados.length;

      return Lines(index, grados * index);
    }));
    Stack Numeros = Stack(
        children: List.generate(resultados.length, (index) {
      double grados = 360 / resultados.length;

      return Numeracion(index, grados * index);
    }));
    Stack Puntuacion = Stack(
        children: List.generate(resultados.length, (index) {
      double grados = 360 / resultados.length;

      return Puntaje(
          index,
          grados * index,
          (maxError < 6 ? 5 : maxError),
          puntaje[index],
          puntaje[(index > 0 ? index - 1 : resultados.length - 1)],
          grados * (index > 0 ? index - 1 : resultados.length - 1));
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
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(sw)),
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
              Spacer(),
              Text(
                'DALTONISMO',
                style: TextoPuntajes,
              ),
              Text(
                (puntajeFinal == 0
                    ? 'NO HAY DALTONISMO'
                    : (puntajeFinal < 120
                        ? 'LEVE'
                        : (puntajeFinal < 190)
                            ? 'MODERADO'
                            : 'SEVERO')),
                style: TextoPuntajes,
              ),
              Spacer(),
              Text(
                'MARCADOR',
                style: TextoPuntajes,
              ),
              Text(
                puntajeFinal.toString(),
                style: TextoPuntajes,
              ),
              Spacer(),
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
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(
                  Radius.circular(MediaQuery.of(context).size.width)),
            ),
            alignment: Alignment.topCenter,
            child: Text((maxError - 2).toString()),
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
              color: Colors.white,
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
        child: ((index >= 2)
            ? Container(
                width: index * (s / 1.1111) / (maxError),
                height: index * (s / 1.1111) / (maxError),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(
                      Radius.circular(MediaQuery.of(context).size.width)),
                ),
                alignment: Alignment.topCenter,
                child: Text((index - 2).toString()),
              )
            : Container()),
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
        color: Colors.black,
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
                color: Colors.red,
              ),
            ],
          )),
    );
  }
}
