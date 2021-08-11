import 'package:farnsworth/provider/config_provider.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigurationCaja extends StatelessWidget {
  bool black = false;

  ConfigurationCaja(this.black);
  List<Offset> position = [];
  double height = 0.0;
  double width = 0.0;

  @override
  Widget build(BuildContext context) {
    final configuration = Provider.of<ConfigProvider>(context);
    final chips = Provider.of<ChipsData>(context);
    configuration.setCajaParameters(black);
    position = configuration.getCajaPosition;
    width = position[1].dy - position[0].dy + 20;
    height = chips.get_len + 20;

    return Positioned(
        top: position[0].dx - 10,
        left: position[0].dy - 20,
        child: Container(
          width: (configuration.getCaja ? width : 0),
          height: (configuration.getCaja ? height : 0),
          decoration: BoxDecoration(
              color: (configuration.getCajaContorno
                  ? (black ? Colors.white : Colors.black)
                  : Colors.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular((configuration.getCajaForma ? 10 : 100)),
              ),
              border: Border.all(
                  color: (black ? Colors.white : Colors.black), width: 2)),
        ));
  }
}
