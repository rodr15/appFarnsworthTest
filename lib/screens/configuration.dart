import 'package:farnsworth/Menu/menu_principal.dart';
import 'package:farnsworth/main.dart';
import 'package:farnsworth/provider/config_provider.dart';
import 'package:farnsworth/widgets/configurationCaja.dart';
import 'package:farnsworth/widgets/configurationChip.dart';
import 'package:farnsworth/widgets/configurationToolBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    final configuration = Provider.of<ConfigProvider>(context);

    Stack blackChips = Stack(
      children: List.generate(16, (index) {
        return ConfigurationChip(true, true, index);
      }),
    );

    Stack whiteChips = Stack(
      children: List.generate(16, (index) {
        return ConfigurationChip(false, true, index);
      }),
    );
    Stack blackObjectives = Stack(
      children: List.generate(16, (index) {
        return ConfigurationChip(true, false, index);
      }),
    );
    Stack whiteObjectives = Stack(
      children: List.generate(16, (index) {
        return ConfigurationChip(false, false, index);
      }),
    );
    return Scaffold(
      floatingActionButton: ConfigurationToolBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            color: Colors.black,
          ),
          ConfigurationCaja(true),
          ConfigurationCaja(false),
          blackObjectives,
          blackChips,
          whiteObjectives,
          whiteChips,
          FloatingActionButton(
              mini: true,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuPrincipal()),
                );
              })
        ],
      ),
    );
  }
}
