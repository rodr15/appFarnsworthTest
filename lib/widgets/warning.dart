import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/notify_avisos.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Warnings extends StatefulWidget {
  @override
  _WarningsState createState() => _WarningsState();
}

class _WarningsState extends State<Warnings> {
  @override
  Widget build(BuildContext context) {
    final notify = Provider.of<Avisos>(context);
    final testData = Provider.of<TestData>(context);
    final appColor = Provider.of<AppColors>(context);
    return Positioned(
      top: MediaQuery.of(context).size.height * 2 / 10,
      left: MediaQuery.of(context).size.width * 2 / 10,
      child: Container(
          width: MediaQuery.of(context).size.width * 6 / 10,
          height: MediaQuery.of(context).size.height * 6 / 10,
          decoration: BoxDecoration(
              border: Border.all(
                color: appColor.getBorderColor,
                width: 3,
              ),
              color: appColor.getLetterColor),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 6 / 10,
                height: MediaQuery.of(context).size.height * (5 / 10) * 2 / 3,
                child: Image.asset(
                  notify.get_Image,
                  width: MediaQuery.of(context).size.width * 6 / 10,
                  height: MediaQuery.of(context).size.height * (5 / 10) * 2 / 3,
                  fit: BoxFit.contain,
                ),
              ),
              Spacer(),
              Container(
                child: Center(
                  child: Text(
                    notify.get_Aviso,
                    style: TextStyle(
                        backgroundColor: Colors.transparent,
                        color: appColor.getBackgroundColor,
                        fontSize: MediaQuery.of(context).size.width * 1 / 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Spacer(),
              (testData.get_testfinished
                  ? Container(
                      child: Center(
                        child: Text(
                          'Presione Enter para ver los resultados',
                          style: TextStyle(
                              backgroundColor: Colors.transparent,
                              color: appColor.getBackgroundColor,
                              fontSize:
                                  MediaQuery.of(context).size.width * 1 / 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  : Container()),
              (notify.get_Aviso == 'Has Terminado?'
                  ? Container(
                      child: Center(
                      child: ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        appColor.getBorderColor)),
                                onPressed: () {
                                  setState(() {
                                    testData.setContinue = true;
                                    testData.setModify = false;
                                  });
                                },
                                child: Text(
                                  'Continuar',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            1 /
                                            30,
                                  ),
                                )),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        appColor.getBorderColor)),
                                onPressed: () {
                                  setState(() {
                                    testData.setModify = true;
                                    testData.setContinue = false;
                                  });
                                },
                                child: Text(
                                  'Modificar',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            1 /
                                            30,
                                  ),
                                )),
                          ]),
                    ))
                  : Container())
            ],
          )),
    );
  }
}
