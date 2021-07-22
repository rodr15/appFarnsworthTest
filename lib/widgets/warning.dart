import 'package:anthony/provider/aplication_colors.dart';
import 'package:anthony/provider/notify_avisos.dart';
import 'package:anthony/provider/test_data.dart';
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
            ],
          )),
    );
  }
}
