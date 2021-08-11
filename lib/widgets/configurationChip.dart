import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/config_provider.dart';
import 'package:farnsworth/provider/data_mobile_chips.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigurationChip extends StatefulWidget {
  bool black;
  bool chip;
  int id = 0;
  ConfigurationChip(this.black, this.chip, this.id);

  @override
  _ConfigurationChipState createState() => _ConfigurationChipState();
}

class _ConfigurationChipState extends State<ConfigurationChip> {
  double len = 0.0;
  Offset position = Offset(0, 0);
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    final configuration = Provider.of<ConfigProvider>(context);
    final chips = Provider.of<ChipsData>(context);
    final appColor = Provider.of<AppColors>(context);
    chips.set_id = widget.id;
    len = chips.get_len;
    configuration.setPositionParameters(widget.black, widget.chip, widget.id);
    position = configuration.getPosition;
    color = chips.get_colores;
    return Positioned(
        top: position.dx,
        left: position.dy,
        child: (widget.chip
            ?
            // Container de Ficha
            Container(
                width: len,
                height: len,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.all(
                    Radius.circular((configuration.getChipForma ? 10 : 100)),
                  ),
                  border: (configuration.getChipContorno
                      ? Border.all(
                          color: (widget.black ? Colors.white : Colors.black),
                          width: 2)
                      : null),
                ),
              )
            :
            // Container de Objetivo
            Container(
                width: len,
                height: len,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: (configuration.getObjectiveContorno
                          ? (configuration.getCajaContorno
                              ? (widget.black ? Colors.black : Colors.white)
                              : (widget.black ? Colors.white : Colors.black))
                          : Colors.orange),
                      width: (configuration.getObjectiveContorno ? 2 : 1)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                        (configuration.getObjectiveForma ? 10 : 100)),
                  ),
                ),
              )));
  }
}
