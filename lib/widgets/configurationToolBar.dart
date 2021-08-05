import 'package:farnsworth/Menu/menu_principal.dart';
import 'package:farnsworth/Preferences/user_preferences.dart';
import 'package:farnsworth/provider/aplication_colors.dart';
import 'package:farnsworth/provider/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigurationToolBar extends StatefulWidget {
  const ConfigurationToolBar({Key? key}) : super(key: key);

  @override
  _ConfigurationToolBarState createState() => _ConfigurationToolBarState();
}

class _ConfigurationToolBarState extends State<ConfigurationToolBar> {
  bool chipForma = false;
  bool chipContorno = false;
  bool objectiveForma = false;
  bool objectiveContorno = false;
  bool caja = false;
  bool cajaForma = false;
  bool cajaContorno = false;

  void _validation(BuildContext context) async {
    final result = await showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              content: Text('Estas seguro de devolverte?'),
              actions: <Widget>[
                OutlinedButton(
                  child: Text('Cancelar'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                OutlinedButton(
                  child: Text('Ok'),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ]);
        });
    if (result) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final configuration = Provider.of<ConfigProvider>(context);
    final appColor = Provider.of<AppColors>(context);

    chipForma = configuration.getChipForma;
    chipContorno = configuration.getChipContorno;
    objectiveForma = configuration.getObjectiveForma;
    objectiveContorno = configuration.getObjectiveContorno;
    caja = configuration.getCaja;
    cajaForma = configuration.getCajaForma;
    cajaContorno = configuration.cajaContorno;

    TextStyle Titulo = TextStyle(
        fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white);
    TextStyle SubTitulo = TextStyle(
        fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black);
    TextStyle Accion = TextStyle(
        fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white);

    Container BotonFlecha = Container(
      height: MediaQuery.of(context).size.width / 35,
      width: MediaQuery.of(context).size.width / 35,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 50,
            ),
          ),
          border: Border.all(color: Colors.green, width: 4)),
      child: Center(
        child: Icon(
          Icons.done,
          color: Colors.green,
          size: MediaQuery.of(context).size.width / 55,
        ),
      ),
    );
    Container BotonX = Container(
      height: MediaQuery.of(context).size.width / 35,
      width: MediaQuery.of(context).size.width / 35,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 50,
            ),
          ),
          border: Border.all(color: Colors.red, width: 4)),
      child: Center(
        child: Icon(
          Icons.close,
          color: Colors.red,
          size: MediaQuery.of(context).size.width / 55,
        ),
      ),
    );

    Container BotonFlechaGrey = Container(
      height: MediaQuery.of(context).size.width / 35,
      width: MediaQuery.of(context).size.width / 35,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 50,
            ),
          ),
          border: Border.all(color: Colors.grey, width: 4)),
      child: Center(
        child: Icon(
          Icons.done,
          color: Colors.grey,
          size: MediaQuery.of(context).size.width / 55,
        ),
      ),
    );
    Container BotonXGrey = Container(
      height: MediaQuery.of(context).size.width / 35,
      width: MediaQuery.of(context).size.width / 35,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 50,
            ),
          ),
          border: Border.all(color: Colors.grey, width: 4)),
      child: Center(
        child: Icon(
          Icons.close,
          color: Colors.grey,
          size: MediaQuery.of(context).size.width / 55,
        ),
      ),
    );

    Container BotonCirculo = Container(
      height: MediaQuery.of(context).size.width / 35,
      width: MediaQuery.of(context).size.width / 35,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 50,
            ),
          ),
          border: Border.all(color: appColor.getBorderColor, width: 4)),
    );
    Container BotonCuadrado = Container(
      height: MediaQuery.of(context).size.width / 35,
      width: MediaQuery.of(context).size.width / 35,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 100,
            ),
          ),
          border: Border.all(color: appColor.getBorderColor, width: 4)),
    );

    Container BotonCirculoGrey = Container(
      height: MediaQuery.of(context).size.width / 35,
      width: MediaQuery.of(context).size.width / 35,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 50,
            ),
          ),
          border: Border.all(color: Colors.grey, width: 4)),
    );
    Container BotonCuadradoGrey = Container(
      height: MediaQuery.of(context).size.width / 35,
      width: MediaQuery.of(context).size.width / 35,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              MediaQuery.of(context).size.width / 100,
            ),
          ),
          border: Border.all(color: Colors.grey, width: 4)),
    );

    void chipFormaOn() {
      setState(() {
        chipForma = true;
        configuration.setChipForma = chipForma;
      });
    }

    void chipFormaOff() {
      setState(() {
        chipForma = false;
        configuration.setChipForma = chipForma;
      });
    }

    void chipContornoOn() {
      setState(() {
        chipContorno = true;
        configuration.setChipContorno = chipContorno;
      });
    }

    void chipContornoOff() {
      setState(() {
        chipContorno = false;
        configuration.setChipContorno = chipContorno;
      });
    }

    Container Configuracion = Container(
        height: MediaQuery.of(context).size.height / 25,
        width: MediaQuery.of(context).size.width / 11,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Text(
            'CONFIGURACIÓN',
            style: Titulo,
          ),
        ));

    Text FichaText = Text('FICHA', style: SubTitulo);
    Container FichaStack = Container(
      height: MediaQuery.of(context).size.height * 2.5 / 10,
      width: MediaQuery.of(context).size.width / 11,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'FORMA',
                style: Accion,
              ),
            )),
        Spacer(),
        Container(
          height: MediaQuery.of(context).size.width / 29,
          width: MediaQuery.of(context).size.width / 12,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              Spacer(),
              InkWell(
                child: (chipForma ? BotonCuadrado : BotonCuadradoGrey),
                onTap: chipFormaOn,
              ),
              Spacer(),
              InkWell(
                child: (!chipForma ? BotonCirculo : BotonCirculoGrey),
                onTap: chipFormaOff,
              ),
              Spacer(),
            ],
          ),
        ),
        Spacer(),
        Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'CONTORNO',
                style: Accion,
              ),
            )),
        Spacer(),
        Row(
          children: [
            Spacer(),
            InkWell(
              child: (chipContorno ? BotonFlecha : BotonFlechaGrey),
              onTap: chipContornoOn,
            ),
            Spacer(),
            InkWell(
              child: (!chipContorno ? BotonX : BotonXGrey),
              onTap: chipContornoOff,
            ),
            Spacer(),
          ],
        ),
        Spacer(),
      ]),
    );

    void objectiveFormaOn() {
      setState(() {
        objectiveForma = true;
        configuration.setObjectiveForma = objectiveForma;
      });
    }

    void objectiveFormaOff() {
      setState(() {
        objectiveForma = false;
        configuration.setObjectiveForma = objectiveForma;
      });
    }

    void objectiveContornoOn() {
      setState(() {
        objectiveContorno = true;
        configuration.setObjectiveContorno = objectiveContorno;
      });
    }

    void objectiveContornoOff() {
      setState(() {
        objectiveContorno = false;
        configuration.setObjectiveContorno = objectiveContorno;
      });
    }

    Text ObjetivoText = Text('OBJETIVO', style: SubTitulo);
    Container ObjetivoStack = Container(
      height: MediaQuery.of(context).size.height * 2.5 / 10,
      width: MediaQuery.of(context).size.width / 11,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'FORMA',
                style: Accion,
              ),
            )),
        Spacer(),
        Container(
          height: MediaQuery.of(context).size.width / 29,
          width: MediaQuery.of(context).size.width / 12,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              Spacer(),
              InkWell(
                child: (objectiveForma ? BotonCuadrado : BotonCuadradoGrey),
                onTap: objectiveFormaOn,
              ),
              Spacer(),
              InkWell(
                child: (!objectiveForma ? BotonCirculo : BotonCirculoGrey),
                onTap: objectiveFormaOff,
              ),
              Spacer(),
            ],
          ),
        ),
        Spacer(),
        Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'CONTORNO',
                style: Accion,
              ),
            )),
        Spacer(),
        Row(
          children: [
            Spacer(),
            InkWell(
              child: (objectiveContorno ? BotonFlecha : BotonFlechaGrey),
              onTap: objectiveContornoOn,
            ),
            Spacer(),
            InkWell(
              child: (!objectiveContorno ? BotonX : BotonXGrey),
              onTap: objectiveContornoOff,
            ),
            Spacer(),
          ],
        ),
        Spacer(),
      ]),
    );

    void cajaOn() {
      setState(() {
        caja = true;
        configuration.setCaja = caja;
      });
    }

    void cajaOff() {
      setState(() {
        caja = false;
        configuration.setCaja = caja;
      });
    }

    void cajaFormaOn() {
      setState(() {
        cajaForma = true;
        configuration.setCajaForma = cajaForma;
      });
    }

    void cajaFormaOff() {
      setState(() {
        cajaForma = false;
        configuration.setCajaForma = cajaForma;
      });
    }

    void cajaContornoOn() {
      setState(() {
        cajaContorno = true;
        configuration.setCajaContorno = cajaContorno;
      });
    }

    void cajaContornoOff() {
      setState(() {
        cajaContorno = false;
        configuration.setCajaContorno = cajaContorno;
      });
    }

    Text CajaText = Text('CAJA', style: SubTitulo);
    Container Caja = Container(
      child: Row(
        children: [
          Spacer(),
          InkWell(
            child: (caja ? BotonFlecha : BotonFlechaGrey),
            onTap: cajaOn,
          ),
          Spacer(),
          InkWell(
            child: (!caja ? BotonX : BotonXGrey),
            onTap: cajaOff,
          ),
          Spacer(),
        ],
      ),
    );
    Container CajaStack = Container(
      height: MediaQuery.of(context).size.height * 2.5 / 10,
      width: MediaQuery.of(context).size.width / 11,
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(children: [
        Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'FORMA',
                style: Accion,
              ),
            )),
        Spacer(),
        Container(
          height: MediaQuery.of(context).size.width / 29,
          width: MediaQuery.of(context).size.width / 12,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              Spacer(),
              InkWell(
                child: (cajaForma ? BotonCuadrado : BotonCuadradoGrey),
                onTap: cajaFormaOn,
              ),
              Spacer(),
              InkWell(
                child: (!cajaForma ? BotonCirculo : BotonCirculoGrey),
                onTap: cajaFormaOff,
              ),
              Spacer(),
            ],
          ),
        ),
        Spacer(),
        Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 10,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'FONDO',
                style: Accion,
              ),
            )),
        Spacer(),
        Row(
          children: [
            Spacer(),
            InkWell(
              child: (cajaContorno ? BotonFlecha : BotonFlechaGrey),
              onTap: cajaContornoOn,
            ),
            Spacer(),
            InkWell(
              child: (!cajaContorno ? BotonX : BotonXGrey),
              onTap: cajaContornoOff,
            ),
            Spacer(),
          ],
        ),
        Spacer(),
      ]),
    );

    BackButton ReturnButton = BackButton(
      color: appColor.getLetterColor,
      onPressed: () {
        _validation(context);
        configuration.savingConfigurations();
      },
    );
    return Container(
      height: MediaQuery.of(context).size.height * 9.8 / 10,
      width: MediaQuery.of(context).size.width / 10,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        children: [
          ReturnButton,
          Spacer(),
          Configuracion,
          Spacer(),
          FichaText,
          FichaStack,
          Spacer(
            flex: 2,
          ),
          ObjetivoText,
          ObjetivoStack,
          Spacer(
            flex: 10,
          ),
          CajaText,
          Caja,
          (caja ? CajaStack : Container()),
          Spacer(
            flex: 10,
          ),
        ],
      ),
    );
  }
}
