import 'dart:ui';
import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final List option;
  Option(this.option);

  @override
  Widget build(BuildContext context) {
    String image = option[0];
    String name = option[1];
    bool selection = option[2];
    final opcion = Container(
          height: MediaQuery.of(context).size.height/3,
          width: MediaQuery.of(context).size.width/3,
          decoration: BoxDecoration(
              color: Colors.blue,
              /*image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image)
        ),*/
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: <BoxShadow>[BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0,10.0),
              ),
              ],
              border: (selection? Border.all(color: Colors.orange,width: 10):null)
          ),
    );
    final nombre = Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height*1.5/10,
      width: MediaQuery.of(context).size.width/3,
      child: Text(name,
        style: TextStyle(
          color: Colors.white,
          backgroundColor: Colors.transparent,
          fontSize: MediaQuery.of(context).size.height/10,
        ),),

    );
    return Padding(
      padding: EdgeInsets.only(
          top:MediaQuery.of(context).size.height*15/30
      ),
      child: Column(
        children: <Widget>[
          opcion,
          nombre,
        ],
      ),
    );
  }
}
