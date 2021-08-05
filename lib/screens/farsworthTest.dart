import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:farnsworth/provider/data_objective_chips.dart';
import 'package:farnsworth/provider/notify_avisos.dart';
import 'package:farnsworth/provider/test_data.dart';
import 'package:farnsworth/screens/juego.dart';
import 'package:farnsworth/screens/results.dart';
import 'package:farnsworth/widgets/cronometer.dart';
import 'package:farnsworth/widgets/tool_bar.dart';
import 'package:farnsworth/widgets/warning.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FarnsworthTest extends StatefulWidget {
  @override
  _FarnsworthTestState createState() => _FarnsworthTestState();
}

class _FarnsworthTestState extends State<FarnsworthTest> {
  int _pulsaciones = 0;

  final FocusNode _focusNode = FocusNode();
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  void _validation(BuildContext context) async {
    final result = false;
  }

  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final objective = Provider.of<ObjectiveData>(context);
    final appColor = Provider.of<AppColors>(context);
    final testData = Provider.of<TestData>(context);

    return WillPopScope(
      onWillPop: () {
        _validation(context);
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: appColor.getBackgroundColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: ToolBar(),
        body: Stack(
          children: <Widget>[
            Juego(),
            (testData.showcronometer ? Cronometer() : Container()),
            (testData.get_Notification ? Warnings() : Container()),
          ],
        ),
      ),
    );
  }
}
