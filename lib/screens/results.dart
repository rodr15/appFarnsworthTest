import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  List objectiveData = [];
  Results(this.objectiveData);

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[],
    );
  }
}
