import 'dart:math';

import 'package:anthony/widgets/ObjectiveChips.dart';
import 'package:anthony/widgets/moble_chips.dart';
import 'package:anthony/widgets/tool_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FifteenChips extends StatelessWidget {
  int opcion = 0;
  bool random = false;
  int minuts = 0;
  int seconds = 0;
  Color toolbarColor = Colors.black;
  FifteenChips(
      this.opcion, this.random, this.minuts, this.seconds, this.toolbarColor);

  @override
  Widget build(BuildContext context) {
    double len = 0.0;
    int numberObjectives = 14;
    List<double> objectiveLen = [];
    List<double> chipsLen = [];
    List<Color> chipsColors = [];
    List<Offset> objectivePositions = [];
    List<Offset> chipsPositions = [];
    List<dynamic> objectiveData = [[], [], []];
    List<dynamic> chipsData = [[], []];
    List<int> rojoLadrillo = [203, 65, 84];
    List<int> verde = [0, 80, 0];
    List<int> azulVerdoso = [93, 193, 185];
    List<int> violeta = [76, 40, 130];
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
    List<int> v = [];
    List<int> rgb = [];

    // Medidas de la pantalla
    void medidas() {
      //print(MediaQuery.of(context).size.width);
      len = (MediaQuery.of(context).size.width * (4 / 5)) / (numberObjectives);
      if (len < 1) {
        len = 10;
      }
      objectiveLen.add(len);
      objectiveLen.add(len);
      chipsLen.add(len);
      chipsLen.add(len);
    }

    // Crear los colors de chips
    void colors() {
      for (int i = 0; i <= 2; i++) {
        v.add(P[opcion][i] - Po[opcion][i]);
      }
      for (int i = 0; i < numberObjectives + 1; i++) {
        for (int j = 0; j <= 2; j++) {
          rgb.add(
              (Po[opcion][j] + v[j] * (i / (numberObjectives + 1))).round());
        }
        chipsColors.add(Color.fromARGB(255, rgb[0], rgb[1], rgb[2]));
        rgb.clear();
      }
      //print(chipsColors);
    }

    // Crear las posiciones de objective y chips
    void positions() {
      for (int i = 0; i <= numberObjectives; i++) {
        objectivePositions.add(Offset(
            MediaQuery.of(context).size.height * 25 / 100, len * i + 75));
        if (i == 0 || i == numberObjectives) {
          chipsPositions.add(objectivePositions[i]);
        } else {
          chipsPositions.add(Offset(
              MediaQuery.of(context).size.height * 60 / 100, len * i + 75));
        }
      }
    }

    void shuffle() {
      var random = Random();
      for (int i = chipsPositions.length - 2; i > 0; i--) {
        var n = random.nextInt(i + 1);
        if (n == 0) {
          n = i;
        }
        var temp = chipsPositions[i];

        chipsPositions[i] = chipsPositions[n];
        chipsPositions[n] = temp;
      }
    }

    // Llenar Objective data
    void data() {
      List noMove = [0, 14];
      for (int i = 0; i <= numberObjectives; i++) {
        objectiveData[0].add(true);
        if (noMove.contains(i)) {
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
    (random ? shuffle() : null);
    data();

    List noMove = [chipsColors[0], chipsColors.last];

    FloatingActionButton ButtonActive = FloatingActionButton(
      onPressed: () {
        print(objectiveData[1].contains(Colors.black));
      },
      child: Icon(Icons.star),
    );

    return Scaffold(
      body: Container(
        color: toolbarColor,
        child: Stack(
          children: <Widget>[
            ObjectiveChips(
                0, len, chipsData, objectiveData, chipsColors, noMove),
            ObjectiveChips(
                1, len, chipsData, objectiveData, chipsColors, noMove),
            ObjectiveChips(
                2, len, chipsData, objectiveData, chipsColors, noMove),
            ObjectiveChips(
                3, len, chipsData, objectiveData, chipsColors, noMove),
            ObjectiveChips(
                4, len, chipsData, objectiveData, chipsColors, noMove),
            ObjectiveChips(
                5, len, chipsData, objectiveData, chipsColors, noMove),
            ObjectiveChips(
                6, len, chipsData, objectiveData, chipsColors, noMove),
            ObjectiveChips(
                7, len, chipsData, objectiveData, chipsColors, noMove),
            ObjectiveChips(
                8, len, chipsData, objectiveData, chipsColors, noMove),
            ObjectiveChips(
                9, len, chipsData, objectiveData, chipsColors, noMove),
            ObjectiveChips(
                10, len, chipsData, objectiveData, chipsColors, noMove),
            ObjectiveChips(
                11, len, chipsData, objectiveData, chipsColors, noMove),
            ObjectiveChips(
                12, len, chipsData, objectiveData, chipsColors, noMove),
            ObjectiveChips(
                13, len, chipsData, objectiveData, chipsColors, noMove),
            ObjectiveChips(
                14, len, chipsData, objectiveData, chipsColors, noMove),
            MobileChips(0, len, chipsData, objectiveData, chipsColors, noMove),
            MobileChips(1, len, chipsData, objectiveData, chipsColors, noMove),
            MobileChips(2, len, chipsData, objectiveData, chipsColors, noMove),
            MobileChips(3, len, chipsData, objectiveData, chipsColors, noMove),
            MobileChips(4, len, chipsData, objectiveData, chipsColors, noMove),
            MobileChips(5, len, chipsData, objectiveData, chipsColors, noMove),
            MobileChips(6, len, chipsData, objectiveData, chipsColors, noMove),
            MobileChips(7, len, chipsData, objectiveData, chipsColors, noMove),
            MobileChips(8, len, chipsData, objectiveData, chipsColors, noMove),
            MobileChips(9, len, chipsData, objectiveData, chipsColors, noMove),
            MobileChips(10, len, chipsData, objectiveData, chipsColors, noMove),
            MobileChips(11, len, chipsData, objectiveData, chipsColors, noMove),
            MobileChips(12, len, chipsData, objectiveData, chipsColors, noMove),
            MobileChips(13, len, chipsData, objectiveData, chipsColors, noMove),
            MobileChips(14, len, chipsData, objectiveData, chipsColors, noMove),
            ToolBar(opcion, random, minuts, seconds, toolbarColor),
          ],
        ),
      ),
    );
  }
}
