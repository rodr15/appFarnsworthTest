import 'dart:math';
import 'package:anthony/widgets/ObjectiveChips.dart';
import 'package:anthony/widgets/moble_chips.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HundredChips extends StatelessWidget {
  bool randomize;
  HundredChips(this.randomize);
  List chipsLen = [];
  List chipsColors = [];
  List chipsPositions = [];
  List chipsData = [[], []];

  List objectiveLen = [];
  List objectiveColors = [];
  List objectivePositions = [];
  List objectiveData = [[], [], []];

  List<int> rojoLadrillo = [203, 65, 84];
  List<int> verde = [0, 80, 0];
  List<int> azulVerdoso = [93, 193, 185];
  List<int> violeta = [76, 40, 130];

  int numChips = 100;
  int opciones = 4;
  double len = 0;
  List<int> v = [];
  List<int> rgb = [];

  List coloresrojo = [];
  List coloresverde = [];
  List coloresazul = [];
  List coloresvioleta = [];
  List acceptedColors = [[], [], [], []];

  @override
  Widget build(BuildContext context) {
    List<dynamic> Po = [
      rojoLadrillo,
      verde,
      azulVerdoso,
      violeta
    ]; // Rojo ladrillo - Verde - Azul(verdoso) - Violeta
    List<dynamic> P = [
      verde,
      azulVerdoso,
      violeta,
      rojoLadrillo
    ]; // Verde-Azul(verdoso)-Violeta-Rojoladrillo

    void medidas() {
      len = MediaQuery.of(context).size.width /
          (numChips / opciones); //-MediaQuery.of(context).size.width*1/10;
      if (len < 1) {
        len = 10;
      }
      objectiveLen.add(len);
      objectiveLen.add(len);
      chipsLen.add(len);
      chipsLen.add(len);
      //print(len);
    }

    void colors() {
      for (int i = 0; i < opciones; i++) {
        for (int a = 0; a < 3; a++) {
          v.add(P[i][a] - Po[i][a]);
        }

        for (int j = 0; j < (numChips / opciones); j++) {
          for (int a = 0; a < 3; a++) {
            rgb.add(
                (Po[i][a] + v[a] * (j / ((numChips / opciones) + 1))).round());
          }
          chipsColors.add(Color.fromARGB(255, rgb[0], rgb[1], rgb[2]));

          switch (i) {
            case 0:
              coloresrojo.add(Color.fromARGB(255, rgb[0], rgb[1], rgb[2]));
              break;
            case 1:
              coloresverde.add(Color.fromARGB(255, rgb[0], rgb[1], rgb[2]));
              break;
            case 2:
              coloresazul.add(Color.fromARGB(255, rgb[0], rgb[1], rgb[2]));
              break;
            case 3:
              coloresvioleta.add(Color.fromARGB(255, rgb[0], rgb[1], rgb[2]));
              break;
          }
          rgb.clear();
        }
        v.clear();
      }
      acceptedColors = [coloresrojo, coloresverde, coloresazul, coloresvioleta];
    }

    void positions() {
      for (int i = 0; i < opciones; i++) {
        for (int j = 0; j < numChips / opciones; j++) {
          objectivePositions.add(Offset(
              i * len + (MediaQuery.of(context).size.height * 2 * i / 10),
              j * len));
          if (j == 0 || j == (numChips / opciones) - 1) {
            chipsPositions.add(objectivePositions[(i * 25) + j]);
          } else {
            chipsPositions.add(Offset(
                i * len +
                    (MediaQuery.of(context).size.height * (2 * i + 1) / 10),
                j * len));
          }
        }
      }
      //print(chipsPositions);
    }

    void shuffle() {
      var random = Random();
      for (int j = 0; j < opciones; j++) {
        for (int i = (chipsPositions.length / opciones).round() - 2;
            i > 0;
            i--) {
          var n = random.nextInt(i + 1);

          if (n == 0) {
            n = i;
          }
          var temp = chipsPositions[(j * 25) + i];
          chipsPositions[(j * 25) + i] = chipsPositions[(j * 25) + n];
          chipsPositions[(j * 25) + n] = temp;
        }
      }
    }

    void data() {
      List noMov = [0, 24, 25, 49, 50, 74, 75, 99];
      for (int i = 0; i < numChips; i++) {
        objectiveData[0].add(true);
        if (noMov.contains(i)) {
          objectiveData[1].add(chipsColors[i]);
        } else {
          objectiveData[1].add(Colors.black);
        }
        objectiveData[2].add(objectivePositions[i]);

        chipsData[0].add(chipsColors[i]);
        chipsData[1].add(chipsPositions[i]);
      }
      //print('FUNCION OB -> ${objectiveData}');
    }

    medidas();
    colors();
    positions();
    //(randomize ? shuffle() : null);
    shuffle();
    data();

    List noMove = [
      coloresrojo[0],
      coloresrojo.last,
      coloresazul[0],
      coloresazul.last,
      coloresverde[0],
      coloresverde.last,
      coloresvioleta[0],
      coloresvioleta.last
    ];

    Stack objetivos = Stack(
      children: List.generate(numChips, (index) {
        int aceptado = 0;
        if (index < 25) {
          aceptado = 0;
        } else if (index < 50) {
          aceptado = 1;
        } else if (index < 75) {
          aceptado = 2;
        } else if (index < 100) {
          aceptado = 3;
        }
        return ObjectiveChips(index, len, chipsData, objectiveData,
            acceptedColors[aceptado], noMove);
      }),
    );

    Stack mobile = Stack(
      children: List.generate(numChips, (index) {
        int aceptado = 0;
        if (index < 25) {
          aceptado = 0;
        } else if (index < 50) {
          aceptado = 1;
        } else if (index < 75) {
          aceptado = 2;
        } else if (index < 100) {
          aceptado = 3;
        }
        return MobileChips(index, len, chipsData, objectiveData,
            acceptedColors[aceptado], noMove);
      }),
    );

    // TODO: implement build
    return Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            objetivos,
            mobile,
          ],
        ));
  }
}
