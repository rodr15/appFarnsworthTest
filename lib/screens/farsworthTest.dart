import 'package:anthony/provider/aplication_colors.dart';
import 'package:anthony/provider/data_mobile_chips.dart';
import 'package:anthony/provider/data_objective_chips.dart';
import 'package:anthony/screens/juego.dart';
import 'package:anthony/widgets/cronometer.dart';
import 'package:anthony/widgets/tool_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FarnsworthTest extends StatelessWidget {
  const FarnsworthTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final objective = Provider.of<ObjectiveData>(context);
    final appColor = Provider.of<AppColors>(context);

    return Scaffold(
      backgroundColor: appColor.getBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: ToolBar(),
      body: Stack(
        children: <Widget>[
          Juego(),
          Cronometer(),
        ],
      ),
    );
  }
}
