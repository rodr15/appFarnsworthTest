import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/notify_avisos.dart';
import 'package:farnsworth/provider/results_provider.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:farnsworth/widgets/results_chip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultsD15 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final objective = Provider.of<ObjectiveData>(context);
    final appColor = Provider.of<AppColors>(context);
    final testData = Provider.of<TestData>(context);
    final notify = Provider.of<Avisos>(context);
    final results = Provider.of<ResultsProvider>(context);
    double s = MediaQuery.of(context).size.height;

    Stack Letreros = Stack(children: [
      if (!(testData.getTiempoData.length < 5))
        Positioned(
            top: (s / 10) / 2,
            child: Row(children: [
              (results.getNumChips < 25
                  ? Text(
                      ('RESULTADO PRUEBA 1  - OJO DERECHO'),
                      style: TextStyle(color: appColor.getLetterColor),
                    )
                  : Row(
                      children: [
                        Text(
                          ('RESULTADO PRUEBA 1 - '),
                          style: TextStyle(color: appColor.getLetterColor),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                Color.fromARGB(255, 178, 118, 111),
                                Color.fromARGB(255, 157, 142, 72)
                              ])),
                        ),
                      ],
                    )),
              Text(
                ' TIEMPO => ${results.getTiempoData[0]} : ${results.getTiempoData[1]} ',
                style: TextStyle(color: appColor.getLetterColor),
              ),
            ])),
      Positioned(
        top: (13 * s / 40) + ((s / 10) - (13 * s / 40)) / 2,
        child: Row(
          children: [
            (results.getNumChips < 25
                ? Text(
                    (!(testData.getTiempoData.length < 5)
                        ? 'RESULTADO PRUEBA 2 - OJO DERECHO'
                        : 'RESULTADO PRUEBA - OJO DERECHO'),
                    style: TextStyle(color: appColor.getLetterColor),
                  )
                : Row(
                    children: [
                      Text(
                        ('RESULTADO PRUEBA 2 - '),
                        style: TextStyle(color: appColor.getLetterColor),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                              Color.fromARGB(255, 151, 145, 75),
                              Color.fromARGB(255, 82, 150, 135)
                            ])),
                      ),
                    ],
                  )),
            Text(
              (!(testData.getTiempoData.length < 5)
                  ? ' TIEMPO => ${results.getTiempoData[2]} : ${results.getTiempoData[3]} '
                  : ' TIEMPO => ${results.getTiempoData[0]} : ${results.getTiempoData[1]} '),
              style: TextStyle(color: appColor.getLetterColor),
            ),
          ],
        ),
      ),
      Positioned(
        top: (22 * s / 40) + ((13 * s / 40) - (22 * s / 40)) / 2,
        child: Row(
          children: [
            (results.getNumChips < 25
                ? Text(
                    (!(testData.getTiempoData.length < 5)
                        ? 'RESULTADO PRUEBA 1 - OJO IZQUIERDO'
                        : 'RESULTADO PRUEBA - OJO IZQUIERDO'),
                    style: TextStyle(color: appColor.getLetterColor),
                  )
                : Row(
                    children: [
                      Text(
                        'RESULTADO PRUEBA 3  -',
                        style: TextStyle(color: appColor.getLetterColor),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                              Color.fromARGB(255, 78, 150, 135),
                              Color.fromARGB(255, 123, 132, 163)
                            ])),
                      ),
                    ],
                  )),
            Text(
              (!(testData.getTiempoData.length < 5)
                  ? ' TIEMPO => ${results.getTiempoData[4]} : ${results.getTiempoData[5]} '
                  : ' TIEMPO => ${results.getTiempoData[2]} : ${results.getTiempoData[3]} '),
              style: TextStyle(color: appColor.getLetterColor),
            ),
          ],
        ),
      ),
      if (!(testData.getTiempoData.length < 5))
        Positioned(
          top: (31 * s / 40) + ((22 * s / 40) - (31 * s / 40)) / 2,
          child: Row(
            children: [
              (results.getNumChips < 25
                  ? Text(
                      'RESULTADO PRUEBA 2  - OJO IZQUIERDO',
                      style: TextStyle(color: appColor.getLetterColor),
                    )
                  : Row(
                      children: [
                        Text(
                          'RESULTADO PRUEBA 4  -',
                          style: TextStyle(color: appColor.getLetterColor),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                Color.fromARGB(255, 132, 132, 163),
                                Color.fromARGB(255, 179, 118, 115)
                              ])),
                        ),
                      ],
                    )),
              Text(
                ' TIEMPO => ${results.getTiempoData[6]} : ${results.getTiempoData[7]} ',
                style: TextStyle(color: appColor.getLetterColor),
              ),
            ],
          ),
        ),
    ]);

    Stack resultadosD1 = Stack(
      children: List.generate(
          (results.getNumChips > 25 ? 22 : results.getNumChips), (index) {
        return ResultsChips(index, 3);
      }),
    );
    Stack resultadosD2 = Stack(
      children: List.generate(
          (results.getNumChips > 25 ? 21 : results.getNumChips), (index) {
        return ResultsChips(
            index, (!(testData.getTiempoData.length < 5) ? 2 : 1));
      }),
    );
    Stack resultadosI1 = Stack(
      children: List.generate(
          (results.getNumChips > 25 ? 21 : results.getNumChips), (index) {
        return ResultsChips(
            index, (!(testData.getTiempoData.length < 5) ? 1 : 0));
      }),
    );
    Stack resultadosI2 = Stack(
      children: List.generate(
          (results.getNumChips > 25 ? 21 : results.getNumChips), (index) {
        return ResultsChips(index, 0);
      }),
    );

    return Stack(
      children: <Widget>[
        Letreros,
        if (!(testData.getTiempoData.length < 5)) resultadosD1,
        resultadosI1,
        resultadosD2,
        if (!(testData.getTiempoData.length < 5)) resultadosI2,
      ],
    );
  }
}
