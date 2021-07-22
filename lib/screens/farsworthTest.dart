import 'package:anthony/provider/aplication_colors.dart';
import 'package:anthony/provider/data_mobile_chips.dart';
import 'package:anthony/provider/data_objective_chips.dart';
import 'package:anthony/provider/notify_avisos.dart';
import 'package:anthony/provider/test_data.dart';
import 'package:anthony/screens/juego.dart';
import 'package:anthony/screens/results.dart';
import 'package:anthony/widgets/cronometer.dart';
import 'package:anthony/widgets/tool_bar.dart';
import 'package:anthony/widgets/warning.dart';
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

  @override
  Widget build(BuildContext context) {
    final chips = Provider.of<ChipsData>(context);
    final objective = Provider.of<ObjectiveData>(context);
    final appColor = Provider.of<AppColors>(context);
    final testData = Provider.of<TestData>(context);

    void _handleKeyEvent(RawKeyEvent event) {
      setState(() {
        _pulsaciones++;
        if (_pulsaciones == 2) {
          switch (event.physicalKey.debugName) {
            case 'Enter':
              if (testData.get_testfinished) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Results()),
                );
              }
          }
        }
      });
    }

    return Scaffold(
      backgroundColor: appColor.getBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: ToolBar(),
      body: Stack(
        children: <Widget>[
          Juego(),
          Cronometer(),
          (testData.get_Notification ? Warnings() : Container()),
          RawKeyboardListener(
              autofocus: true,
              focusNode: _focusNode,
              onKey: _handleKeyEvent,
              child: Container())
        ],
      ),
    );
  }
}
